# def make_foods
#   60.times do
#     Food.create(name: Faker::Food.dish,
#                 calories: Faker::Number.number(3))
#   end
# end

# def make_meals
#   meal_names = ["Breakfast", "Lunch", "Dinner"]
#   meal_names.map do |name|
#     Meal.create(name: name)
#   end
# end

# make_foods
# make_meals
 
# foods = Food.all
# meals = Meal.all

# 15.times do 
#   MealFood.create(meal: meals.sample, food: foods.sample)
# end

banana = Food.create(name: "Banana", calories: 200)
strawberries = Food.create(name: "Strawberries", calories: 200)
almonds = Food.create(name: "Almonds", calories: 800)
breakfast = Meal.create(name: "Breakfast")
lunch = Meal.create(name: "Lunch")
dinner = Meal.create(name: "Dinner")
snacks = Meal.create(name: "Snacks")
MealFood.create(meal: breakfast, food: banana)
MealFood.create(meal: breakfast, food: banana)
MealFood.create(meal: dinner, food: banana)
MealFood.create(meal: dinner, food: banana)
MealFood.create(meal: snacks, food: almonds)
MealFood.create(meal: snacks, food: almonds)
MealFood.create(meal: snacks, food: almonds)

MealFood.create(meal: breakfast, food: strawberries)
MealFood.create(meal: lunch, food: strawberries)
MealFood.create(meal: dinner, food: strawberries)