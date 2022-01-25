class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true
  validates :is_available, presence: true
  validates :city, presence: true
  validates :price, presence: true
end
