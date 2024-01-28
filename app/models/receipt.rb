class Receipt < ApplicationRecord
  belongs_to :vendor, optional: false
  belongs_to :user, optional: false

  has_many :receipt_items, dependent: :destroy
end