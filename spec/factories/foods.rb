FactoryBot.define do
  factory :food do
    name { Faker::Hipster.word }
    calories { Faker::Number.number(3) }
  end
end
