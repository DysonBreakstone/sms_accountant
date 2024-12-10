class ReceiptDissector
  def initialize(vision_api_response)
    @data = JSON.parse(vision_api_response)
  end

  def identify_vendor(info)
    
  end

  def identify_items(info)

  end

  def identify_total(info)

  end
end