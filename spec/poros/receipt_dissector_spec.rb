require 'rails_helper'

RSpec.describe ReceiptDissector do
  before do
    @panda = Vendor.create!(name: "panda express", default_category: "eating out")
    @soops = Vendor.create!(name: "king soopers", default_category: "grocery")
    @soops_1 = File.read("spec/fixtures/image_responses/soops_1.json")
    @soops_dissector_1 = ReceiptDissector.new(@soops_1)
    @soops_2 = File.read("spec/fixtures/image_responses/soops_2.json")
    @soops_dissector_2 = ReceiptDissector.new(@soops_2)
    @soops_3 = File.read("spec/fixtures/image_responses/soops_3.json") # unreadable
    @soops_dissector_3 = ReceiptDissector.new(@soops_3)
    @soops_4 = File.read("spec/fixtures/image_responses/soops_4.json") # unreadable
    @soops_dissector_4 = ReceiptDissector.new(@soops_4)
    @tj_1 = File.read("spec/fixtures/image_responses/tj_1.json")
    @tj_dissector_1 = ReceiptDissector.new(@tj_1)
    @tj_2 = File.read("spec/fixtures/image_responses/tj_2.json") # No sales tax!
    @tj_dissector_2 = ReceiptDissector.new(@tj_2)
    @costco_1 = File.read("spec/fixtures/image_responses/costco_1.json")
    @costco_dissector_1 = ReceiptDissector.new(@costco_1)
    @dsw = File.read("spec/fixtures/image_responses/dsw.json")
    @dsw_dissector = ReceiptDissector.new(@dsw)
    @hmart_1 = File.read("spec/fixtures/image_responses/hmart_1.json")
    @hmart_dissector = ReceiptDissector.new(@hmart_1)
    @panda_express_1 = File.read("spec/fixtures/image_responses/panda_express_1.json")
    @panda_dissector = ReceiptDissector.new(@panda_express_1)
    @paradies_lagardere = File.read("spec/fixtures/image_responses/paradies_lagardere.json")
    @paradies_dissector = ReceiptDissector.new(@paradies_lagardere)
  end

  describe "identify_vendor" do
    it "should identify the vendor if the vendor exists in database" do
      expect(@soops_dissector_1.identify_vendor).to eq("king soopers")
      expect(@soops_dissector_2.identify_vendor).to eq("king soopers")
      expect(@panda_dissector.identify_vendor).to eq("panda express")
    end
    
    it "should return nil for Vendors which are not in the database or which are unreadable" do
      expect(@tj_dissector_1.identify_vendor).to be_nil
      expect(@costco_dissector_1.identify_vendor).to be_nil
      expect(@soops_dissector_3.identify_vendor).to be_nil
      expect(@soops_dissector_4.identify_vendor).to be_nil
    end
  end

  describe "identify total" do
    it "should identify the total price of the order" do
      expect(@soops_dissector_1.identify_total).to eq(5.99), "Soops 1 #{@soops_dissector_1.identify_total}"
      expect(@soops_dissector_2.identify_total).to eq(15.81), "Soops 2 #{@soops_dissector_2.identify_total}"
      expect(@soops_dissector_3.identify_total).to eq(41.06), "Soops 3 #{@soops_dissector_3.identify_total}"
      expect(@soops_dissector_4.identify_total).to eq(11.82), "Soops 4 #{@soops_dissector_4.identify_total}"
      expect(@tj_dissector_1.identify_total).to eq(19.50), "TJs #{@tj_dissector_1.identify_total}"
      expect(@costco_dissector_1.identify_total).to eq(160.23), "Costco #{@costco_dissector_1.identify_total}"
      expect(@hmart_dissector.identify_total).to eq(53.83), "HMart #{@hmart_dissector.identify_total}"
      expect(@panda_dissector.identify_total).to eq(21.84), "Panda Express #{@panda_dissector.identify_total}"
      expect(@dsw_dissector.identify_total).to eq(97.30), "DSW #{@dsw_dissector.identify_total}"
      expect(@paradies_dissector.identify_total).to eq(9.29), "Paradies #{@paradies_dissector.identify_total}"
    end
  end
end