class ItemOrder < ApplicationRecord
  belongs_to :items
  belongs_to :customer
end
