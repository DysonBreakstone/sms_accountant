require 'rails_helper'

RSpec.describe Receipt do 
  before do
    model_test_data
  end

  it "exists" do
    expect(@receipt).to be_a(Receipt)
  end
end