require 'rails_helper'

RSpec.describe Alias do 
  before do
    model_test_data
  end

  it "exists" do
    expect(@alias_1).to be_a(Alias)
  end
end