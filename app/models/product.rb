class Product < ApplicationRecord
  belongs_to :user
  has_many :booking_requests
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description, against: %i[name description], using: { tsearch: { prefix: true } }
end
