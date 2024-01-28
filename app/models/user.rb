class User < ApplicationRecord
  has_secure_password

  has_many :receipts
  has_many :item_aliases, dependent: :destroy
end