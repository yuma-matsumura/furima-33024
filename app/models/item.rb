class Item < ApplicationRecord
  VALID_PRICE_REGEX = /\A[0-9]+\z/i.freeze
  with_options format: { with: VALID_PRICE_REGEX } do
    validates :price
  end

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  validates :price, numericality: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :delivery_time_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :delivery_time
end
