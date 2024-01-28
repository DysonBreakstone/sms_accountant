class Vendor < ApplicationRecord
  has_many :receipts
  has_many :users, through: :receipts
  has_many :items
end