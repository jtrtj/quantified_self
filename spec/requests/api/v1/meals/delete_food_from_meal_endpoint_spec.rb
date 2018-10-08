require 'rails_helper'

describe '/api/v1' do
  context 'DELETE /meals/:meal_id/foods/:id' do
    it 'will remove the specified food from the specified meal and return a success message' do
      foods = create_list(:food, 3)
      meal = create(:meal)
      foods.each do |food|
        MealFood.create(meal: meal, food: food)
      end
      food_to_delete = foods.first
      expected_result = "Successfully removed #{food_to_delete.name} from #{meal.name}"

      delete "/api/v1/meals/#{meal.id}/foods/#{food_to_delete.id}"
      result = JSON.parse(response.body)

      expect(meal.foods).not_to include(food_to_delete)
      expect(status).to eq(200)
      expect(result["message"]).to eq(expected_result)
    end

    it 'will return status 404 if food does not exitist' do
      non_existant_food_id = 543256
      non_existant_meal_id = 543256
      foods = create_list(:food, 3)
      meal = create(:meal)
      foods.each do |food|
        MealFood.create(meal: meal, food: food)
      end
      food_to_delete = foods.first

      delete "/api/v1/meals/#{meal.id}/foods/#{non_existant_food_id}"
      expect(status).to eq(404)

      delete "/api/v1/meals/#{non_existant_meal_id}/foods/#{foods.first.id}"
      expect(status).to eq(404)
    end
  end
end