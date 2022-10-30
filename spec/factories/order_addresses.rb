FactoryBot.define do
  factory :order_address do
    post_number { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    delivery_area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    apartment { Faker::Address.street_address }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
