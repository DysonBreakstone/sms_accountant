require 'rails_helper'

RSpec.describe Item do 
  before do
    model_test_data
  end
  
  describe "existence and relationships" do
    it { should belong_to :vendor }
    it { should have_many :receipt_items }
    it { should have_many(:receipts).through :receipt_items }
    it { should have_many :item_aliases }
    
    it "exists" do
      expect(@vendor).to be_a(Vendor)
    end
  end
end