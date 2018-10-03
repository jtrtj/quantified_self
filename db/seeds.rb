def make_foods
  10.times do
    Food.create(name: Faker::Food.dish,
                calories: Faker::Number.number(3))
  end
end
def make_meals
  meal_names = ["Breakfast", "Lunch", "Dinner"]
  meal_names.map do |name|
    Meal.create(name: name)
  end
end
make_foods
make_meals

foods = Food.all
meals = Meal.all

15.times do 
  MealFood.create(meal: meals.sample, food: foods.sample)
end