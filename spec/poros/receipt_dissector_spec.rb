require 'rails_helper'

RSpec.describe ReceiptDissector do
  before do
    @soops_1 = File.read("../fixtures/image_responses/soops_1.json")
    @soops_2 = File.read("../fixtures/image_responses/soops_2.json")
    @soops_3 = File.read("../fixtures/image_responses/soops_3.json")
    @soops_4 = File.read("../fixtures/image_responses/soops_4.json")
    @tj_1 = File.read("../fixtures/image_responses/tj_1.json")
    @tj_2 = File.read("../fixtures/image_responses/tj_2.json")
    @costco_1 = File.read("../fixtures/image_responses/costco_1.json")
    @dsw = File.read("../fixtures/image_responses/dsw.json")
    @hmart_1 = File.read("../fixtures/image_responses/hmart_1.json")
    @panda_express_1 = File.read("../fixtures/image_responses/panda_express_1.json")
    @paradies_legardere = File.read("../fixtures/image_responses/paradies_legardere.json")
  end

  describe "king soopers" do
    it "should identify the vendor" do
      require 'pry'; binding.pry
    end
  end
end