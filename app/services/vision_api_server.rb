class VisionApiService
  VISION = Google::Cloud::Vision.image_annotator
  API_KEY = ENV["VISION_API_KEY"]

  def build_digital_ocean_url(object_key:)
    DigitalOceanService.new.generate_presigned_url
  end

  def make_http_call(url)
    vision_client = Google::Cloud::Vision.image_annotator
    response = vision_client.text_detection(image: url)
  end

  def create_connection(url)
    Faraday.new(
      url: url,
      params: {key: API_KEY},

    )
  end
end
