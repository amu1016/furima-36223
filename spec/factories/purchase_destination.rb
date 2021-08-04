FactoryBot.define do
  factory :purchase_destination do
    postal_code   {'123-4567'}
    prefecture_id   {Faker::Number.between(from: 1,to: 47)}
    city {'テスト市'}
    address   {'テスト町'}
    building_name   {'テストハイツ201号室'}
    phone_number   {'04012341234'}
    token   {"tok_abcdefghijk00000000000000000"}
  end
end
