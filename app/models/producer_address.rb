class ProducerAddress < ApplicationRecord
  belongs_to :producer, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :postal_code, :city, :house_number, :building_name ,presence: true
end
