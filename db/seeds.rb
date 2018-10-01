10.times do
  Food.create(name: Faker::Hipster.word,
              calories: Faker::Number.number(3))
end