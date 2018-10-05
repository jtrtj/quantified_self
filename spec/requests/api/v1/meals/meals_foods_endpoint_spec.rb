require 'rails_helper'

describe '/api/v1' do
  context 'GET /meals/:meal_id/foods' do
    it 'returns all the foods associated with the meal with an id specified by :meal_id' do
      foods = create_list(:food, 3)
      meal = create(:meal)
      foods.each do |food|
        MealFood.new(meal: meal, food: food)
      end

      get "/api/v1/meals/#{meal.id}/foods"
      result = JSON.parse(response.body)

      expect(result).to have_key("id")
      expect(result).to have_key("name")
      expect(result).to have_key("foods")
      expect(result["foods"].count).to eq(3)
      expect(result["foods"][1]).to have_key("id")
      expect(result["foods"][1]).to have_key("name")
      expect(result["foods"][1]).to have_key("calories")
    end
  end
end