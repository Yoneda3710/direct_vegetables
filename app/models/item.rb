class Item < ApplicationRecord
  belongs_to :producer, optional: true
  has_one :item_order
  has_one_attached :image
end
