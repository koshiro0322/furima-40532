FactoryBot.define do
  factory :purchase_address do
    user_id { 1 }
    item_id { 2 }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { Faker::PhoneNumber.cell_phone.gsub(/\D/, '') }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
