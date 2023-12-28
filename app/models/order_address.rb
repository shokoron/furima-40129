class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number without hyphen and must be 10 or 11 digits" }
    validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      shipping_area_id: shipping_area_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
