class Address < ApplicationRecord
  belongs_to :customer, optional: true
  validates :postal_code, :city, :house_number, :building_name ,presence: true
end
