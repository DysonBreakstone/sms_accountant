require 'rails_helper'

RSpec.describe DigitalOceanService do
  it "should be able to list buckets" do
    service = DigitalOceanService.new
    expect(service.list_buckets.count).to eq(1)
  end

  xit "should upload and destroy images" do
    user = User.create!(password: "password")
    service = DigitalOceanService.new
    object_key = "test/baby_cakes"

    original_image_count = service.list_objects(bucket: "cashyou-receipts").count
    
    service.upload_receipt!(filename: Rails.root.join("lib", "assets", "moon_jars.jpg").to_s, object_key: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count + 1)
    
    service.delete_receipt(keys: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count)
  end

  it "generates presigned url with 'cashew-receipts' default" do
    service = DigitalOceanService.new
    url = service.generate_presigned_url(object_key: "bilbo-baggins")
    expect(url).not_to be_nil
    expect(url).to be_a(String)
    expect(url.match(/^https\/\/sfo2.digitaloceanspaces.com\/cashyou-receipts\/bilbo_baggins/))
  end

  it "should authorize google vision requests" do
    service = DigitalOceanService.new
    object_key = "panda_express_1"
    service.delete_receipt(keys: object_key)
    service.upload_receipt!(filename: Rails.root.join("lib", "assets", "panda_express_1.jpg").to_s, object_key: object_key)
    response = VisionApiService.new.make_text_detection_http_call(object_key: object_key)
    service.delete_receipt(keys: object_key)
  end

end