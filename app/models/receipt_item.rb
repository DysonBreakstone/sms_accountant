class ReceiptItem < ApplicationRecord
  belongs_to :receipt
  belongs_to :item
  
  scope :user, -> {receipt.user}
end