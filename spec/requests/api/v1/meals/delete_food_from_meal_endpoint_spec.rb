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
      expected_result = "Successfully removed #{food_to_delete.name} to #{meal.name}"
      
      delete "/api/v1/meals/#{meal.id}/foods/#{food_to_delete.id}"
      result = JSON.parse(response.body)

      expect(status).to eq(200)
      expect(result["message"]).to eq(expected_result)
    end
  end
end