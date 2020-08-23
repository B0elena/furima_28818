FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    product            {Faker::Lorem.sentence}
    description        {Faker::Lorem.sentence}
    category_id        {2}
    condition_id       {2}
    shipping_cost_id   {2}
    shipping_origin_id {2}
    shipping_day_id    {2}
    price              {300}
    association :user
  end
end
