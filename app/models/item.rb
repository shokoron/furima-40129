class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1, message: " can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: " can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: " can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: " can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: " can't be blank" }
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
