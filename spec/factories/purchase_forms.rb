FactoryBot.define do
  factory :purchase_form do
    postal_code             { '333-4444' }
    shipping_area_id        { 2 }
    city                    { 'test' }
    house_number            { 'test' }
    telephone_number        { '11111111111' }
    token                   { 'tok_abcdefghijk00000000000000000' }

  end
end
