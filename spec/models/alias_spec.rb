require 'rails_helper'

RSpec.describe ItemAlias do 
  before do
    model_test_data
  end

  it "exists" do
    expect(@item_alias_1).to be_a(ItemAlias)
  end
end