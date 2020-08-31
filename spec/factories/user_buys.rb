FactoryBot.define do
  factory :user_buy do
    postcode { '123-4567' }
    state_id { 2 }
    city     { Faker::Lorem.sentence }
    street   { Faker::Lorem.sentence }
    building { Faker::Lorem.sentence }
    phone    { '09012345678' }
    token    { Faker::Lorem.sentence }
  end
end
