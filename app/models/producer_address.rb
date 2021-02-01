class ProducerAddress < ApplicationRecord
  belongs_to :producer, optional: true
  validates :postal_code, :city, :house_number, :building_name ,presence: true
end
