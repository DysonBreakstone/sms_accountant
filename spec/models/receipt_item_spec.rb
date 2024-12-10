require 'rails_helper'

RSpec.describe ReceiptItem do 
  before do
    model_test_data
  end
  
  describe "existence and relationships" do
    it { should belong_to :receipt }
    it { should belong_to :item }

    it "exists" do
      expect(@receipt_item).to be_a(ReceiptItem)
    end
  end  
end