class BookingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :product

  attribute :is_confirmed, default: false
end
