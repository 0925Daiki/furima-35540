FactoryBot.define do
  factory :item do
    name               {"test"}
    price              {"9999"}
    description        {"aaaa"}
    category_id        {"レディース"}
    status_id          {"新品、未使用"}
    delivery_charge_id {"着払い(購入者負担)"}
    shipping_area_id   {"北海道"}
    days_to_ship_id    {"1〜2日で発送"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
