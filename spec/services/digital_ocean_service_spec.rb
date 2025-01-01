require 'rails_helper'

RSpec.describe AwsService do
  it "should be able to list buckets" do
    service = AwsService.new
    expect(service.list_buckets.count).to eq(1)
  end

  xit "should upload and destroy images" do
    user = User.create!(password: "password")
    service = AwsService.new
    object_key = "test/test_image"

    original_image_count = service.list_objects(bucket: "cashyou-receipts").count
    
    ret = service.upload_receipt!(filename: Rails.root.join("spec", "fixtures", "images", "panda_express_1.jpg").to_s, object_key: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count + 1)
    
    service.delete_receipt(keys: object_key)

    expect(service.list_objects(bucket: "cashyou-receipts").count).to eq(original_image_count)
  end

  it "generates presigned url with 'cashyou-receipts' default" do
    service = AwsService.new
    url = service.generate_presigned_url(object_key: "bilbo-baggins")
    expect(url).not_to be_nil
    expect(url).to be_a(String)
    expect(url.match(/^https:\/\/s3.us-west-1.amazonaws.com\/cashyou-receipts\/bilbo-baggins/)).to be_truthy
  end

  xit "should authorize google vision requests" do
    service = AwsService.new
    object_key = "hmart_1"
    service.delete_receipt(keys: object_key)
    service.upload_receipt!(filename: Rails.root.join("spec", "fixtures", "images", "hmart_1.jpg").to_s, object_key: object_key)
    response = VisionApiService.new.make_text_detection_http_call(object_key: object_key)
    service.delete_receipt(keys: object_key)
  end

end