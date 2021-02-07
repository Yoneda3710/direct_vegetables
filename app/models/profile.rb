class Profile < ApplicationRecord
  belongs_to :producer
  has_one_attached :image
end
