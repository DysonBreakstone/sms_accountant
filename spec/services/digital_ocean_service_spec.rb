require 'rails_helper'

RSpec.describe DigitalOceanService do
  it "should be able to list buckets" do
    service = DigitalOceanService.new
    expect(service.list_buckets.count).to eq(1)
  end

  xit "should upload and destroy images" do
    user = User.create!(password: "password")
    service = DigitalOceanService.new
    object_key = "test/test_object"

    original_image_count = service.list_objects(bucket: "cashyou-receipts").count
    
    service.upload_receipt!(filename: Rails.root.join("lib", "assets", "moon_jars.jpg").to_s, object_key: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count + 1)
    
    service.delete_receipt(keys: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count)
  end

end