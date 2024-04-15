FactoryBot.define do
  factory :item do
    association :user
    itemname { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 18) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 5) }
    shipping_fee_responsibility_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    shipping_duration_id { Faker::Number.between(from: 2, to: 5) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
