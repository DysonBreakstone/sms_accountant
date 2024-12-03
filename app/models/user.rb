class User < ApplicationRecord
  has_secure_password

  has_many :receipts
  has_many :item_aliases, dependent: :destroy

  def next_receipt_filename
    "#{id}_receipt_#{receipts.count + 1}"
  end
end