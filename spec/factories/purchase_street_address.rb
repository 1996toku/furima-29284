FactoryBot.define do
  factory :purchase_street_address do
    token { 'dfgahsmkrhjutkui' }

    postal_code { '123-4567' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::String.random }
    address { Faker::String.random }
    building_name         { Faker::String.random }
    phone_nunber          { Faker::Number.number(digits: 11) }

    association :user
    association :item
  end
end
