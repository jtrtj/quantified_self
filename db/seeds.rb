10.times do
  Food.create(name: Faker::Food.dish,
              calories: Faker::Number.number(3))
end