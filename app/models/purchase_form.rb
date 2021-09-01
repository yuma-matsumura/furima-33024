class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name,
                :telephone_number, :token

  validates :token, presence: true

  with_options presence: true do
    validates :postal_code
    validates :shipping_area_id
    validates :city
    validates :house_number
    validates :telephone_number
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :shipping_area_id
  end

  VALID_CITY_REGEX = /\A\d{3}-\d{4}\z/.freeze
  with_options format: { with: VALID_CITY_REGEX } do
    validates :postal_code
  end

  VALID_TELEPHONE_REGEX = /\A\d{,11}\z/.freeze
  with_options format: { with: VALID_TELEPHONE_REGEX } do
    validates :telephone_number
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: @order.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end
