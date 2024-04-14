FactoryBot.define do
  factory :item do
    association :user
    itemname { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 18) }
    price { Faker::Commerce.price(range: 10.0..1000.0) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 5) }
    shipping_fee_responsibility_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    shipping_duration_id { Faker::Number.between(from: 2, to: 5) }
  end
end
