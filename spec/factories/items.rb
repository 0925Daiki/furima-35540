FactoryBot.define do
  factory :item do
    name               {"test"}
    price              {9999}
    description        {"aaaa"}
    category_id           {2}
    status_id             {2}
    delivery_charge_id    {2}
    shipping_area_id      {2}
    days_to_ship_id       {2}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
