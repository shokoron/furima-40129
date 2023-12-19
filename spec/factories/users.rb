FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    nickname { Faker::Name.unique.name }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
