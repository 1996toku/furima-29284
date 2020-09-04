FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'a0' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '太郎' }
    first_name            { '田中' }
    last_name_kana        { 'タロウ' }
    first_name_kana       { 'タナカ' }
    birthday              { '2010-01-01' }
  end
end
