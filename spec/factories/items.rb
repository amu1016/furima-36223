FactoryBot.define do
  factory :item do
    name   {'テスト'}
    description {'テストです'}
    category_id   {Faker::Number.between(from: 1,to: 10)}
    condition_id   {Faker::Number.between(from: 1,to: 6)}
    postage_id   {Faker::Number.between(from: 1,to: 2)}
    prefecture_id   {Faker::Number.between(from: 1,to: 47)}
    days_to_ship_id   {Faker::Number.between(from: 1,to: 3)}
    price   {Faker::Number.between(from: 300,to: 9999999)}
    association :user 
  end
end
