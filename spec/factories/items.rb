FactoryBot.define do
  factory :item do
    name { Faker::Team.name }
    content { Faker::Lorem.sentence }
    category { Category.all.sample }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status { Status.all.sample }
    status_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge { DeliveryCharge.all.sample }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    delivery_area { DeliveryArea.all.sample }
    delivery_area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_day { DeliveryDay.all.sample }
    delivery_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.number(digits: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
