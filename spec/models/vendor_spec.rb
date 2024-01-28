require 'rails_helper'

RSpec.describe Vendor do 
  before do
    model_test_data
  end

  it "exists" do
    expect(@vendor).to be_a(Vendor)
  end
end