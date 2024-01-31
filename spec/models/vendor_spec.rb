require 'rails_helper'

RSpec.describe Vendor do 
  before do
    model_test_data
  end

  describe "existence and relationships" do
    it { should have_many :receipts }
    it { should have_many(:users).through :receipts }
    it { should have_many :items }
    
    it "exists" do
      expect(@vendor).to be_a(Vendor)
    end
  end
end