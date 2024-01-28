class Item < ApplicationRecord
  belongs_to :vendor, optional: false
  has_many :item_aliases
  has_many :receipt_items
  has_many :receipts, through: :receipt_items 

end