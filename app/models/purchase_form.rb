class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number

  with_options presence: true do
    validates :postal_code
    validates :shipping_area_id
    validates :city
    validates :house_number
    validates :building_name
    validates :telephone_number
  end

def save
  Order.create(user_id: user_id, item_id: item_id)
  Address.create(order_id: order_id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number)


end
end
