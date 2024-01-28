require 'rails_helper'

RSpec.describe ReceiptItem do 
  before do
    model_test_data
  end

  it "exists" do
    expect(@receipt_item_1).to be_a(ReceiptItem)
  end
end