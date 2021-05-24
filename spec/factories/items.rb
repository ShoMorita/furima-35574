FactoryBot.define do
  factory :item do
    name  {'商品'}
    description {'説明'}
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    selling_price { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    
  end
end
