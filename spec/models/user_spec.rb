require 'rails_helper'

RSpec.describe User do 
  before do
    model_test_data
  end

  describe "existence and relationships" do 
    it { should have_many :receipts }
    it { should have_many :item_aliases }
    
    it "exists" do
      expect(@user).to be_a(User)
    end
  end
end