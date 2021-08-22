FactoryBot.define do
  factory :item do
    product_name             { 'test' }
    text                     { 'test' }
    category_id              { '2' }
    product_condition_id     { '2' }
    shipping_charge_id       { '2' }
    shipping_area_id         { '2' }
    delivery_time_id         { '2' }
    price                    { '301' }
    user_id                  { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
