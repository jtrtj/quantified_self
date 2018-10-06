require 'rails_helper'

describe 'api/v1' do
  context 'GET /favorite_foods' do
    it 'returns a list of the top three amounts foods are eaten and the corrosponding foods' do
      banana = Food.create(name: "Banana", calories: 200)
      strawberries = Food.create(name: "Strawberries", calories: 200)
      almonds = Food.create(name: "Almonds", calories: 800)
      breakfast = Meal.create(name: "Breakfast")
      lunch = Meal.create(name: "Lunch")
      dinner = Meal.create(name: "Dinner")
      snacks = Meal.create(name: "Snacks")

      create_list(:meal_food, 2, meal: breakfast, food: banana)
      create_list(:meal_food, 2, meal: dinner, food: banana)
      create_list(:meal_food, 3, meal: snacks, food: almonds)
      create(:meal_food, meal: breakfast, food: strawberries)
      create(:meal_food, meal: lunch, food: strawberries)
      create(:meal_food, meal: dinner, food: strawberries)

      get '/api/v1/favorite_foods'
      result = JSON.parse(response.body)

      expect(result).to be_an(Array)
      expect(result[0]["timesEaten"]).to eq(4)
      expect(result[1]["timesEaten"]).to eq(3)
      expect(result[0]["foods"][0]["name"]).to eq("Banana")
      expect(result[0]["foods"][0]["mealsWhenEaten"]).to include("Breakfast", "Dinner")
    end
  end
end