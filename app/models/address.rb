class Address < ApplicationRecord
  belongs_to :order

  # validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  # validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :city, presence: true
  # validates :street_address, presence: true
  # validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number without hyphen and must be 10 or 11 digits" }
end
