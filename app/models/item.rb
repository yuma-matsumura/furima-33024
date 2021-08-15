class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :password_confirmation, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_area, presence: true
  validates :delivery_time, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :image

end
