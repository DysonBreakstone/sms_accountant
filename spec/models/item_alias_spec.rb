require 'rails_helper'

RSpec.describe ItemAlias do 
  before do
    model_test_data
  end

  describe "existence and relationships" do
    it { should belong_to :user }
    it { should belong_to :item }
  
    it "exists" do
      expect(@item_alias).to be_a(ItemAlias)
    end
  end
end