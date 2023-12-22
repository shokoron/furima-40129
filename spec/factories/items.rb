FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'テスト商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
