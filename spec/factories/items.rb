FactoryBot.define do
  factory :item do
    name                         { Faker::String.random }
    text                         { Faker::String.random }
    category_id                  { Faker::Number.between(from: 2, to: 11) }
    status_id                    { Faker::Number.between(from: 2, to: 7) }
    shopping_chipping_id         { Faker::Number.between(from: 2, to: 3) }
    area_of_delivary_id          { Faker::Number.between(from: 2, to: 48) }
    days_until_shopping_id       { Faker::Number.between(from: 2, to: 4) }
    price                        { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
