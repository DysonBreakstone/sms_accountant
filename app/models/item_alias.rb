class ItemAlias < ApplicationRecord
  belongs_to :item, optional: false
  belongs_to :user, optional: false
end