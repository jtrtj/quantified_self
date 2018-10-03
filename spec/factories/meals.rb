FactoryBot.define do
  factory :meal do
    name { Faker::DrWho.specie }
  end
end
