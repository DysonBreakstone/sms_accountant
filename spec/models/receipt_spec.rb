require 'rails_helper'

RSpec.describe Receipt do 
  before do
    model_test_data
  end

  describe "existence and relationships" do
    it { should belong_to :vendor }
    it { should belong_to :user }
    it { should have_many :receipt_items }

    it "exists" do
      expect(@receipt).to be_a(Receipt)
    end
  end
end