FactoryBot.define do
  factory :order_address do
    postal_code      {'123-4567'}
    shipping_area_id {2}
    municipality     {'テスト市テスト町'}
    city             {'青山1-1-1'}
    building_name    {'name'}
    phone            {'09011112222'}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
