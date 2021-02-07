class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday ,presence: true
  has_many :items
  has_one :producer_address
  has_one :profile
end
