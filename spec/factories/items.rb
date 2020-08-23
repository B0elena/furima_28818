FactoryBot.define do
  factory :item do
    image              {"a"}
    product            {"商品名"}
    description        {"商品説明"}
    category_id        {"2"}
    condition_id       {"2"}
    shipping_cost_id   {"2"}
    shipping_origin_id {"2"}
    shipping_day_id    {"2"}
    price              {"300"}
    association :user
  end
end
