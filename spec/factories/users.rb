FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password + '1a' }
    password_confirmation { password }
    lastname_kanji        { '山田' }
    firstname_kanji       { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
