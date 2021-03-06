FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'test1234'}
    password_confirmation {password}
    last_name {Gimei.last.kanji}
    first_name {Gimei.first.kanji}
    last_name_kana {Gimei.last.katakana}
    first_name_kana {Gimei.first.katakana}
    birth_date {Faker::Date.between(from: '1930-01-01', to: Date.today)}
  end
end
