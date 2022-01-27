class Product < ApplicationRecord
  belongs_to :user
  has_many :booking_requests
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :photo, presence: true
end
