require 'rails_helper'

describe '/api/v1' do
  context 'POST /meals/:meal_id/foods/:id' do
    it 'adds the food with corresponding id to the meal with corresponding id' do
      meal = create(:meal)
      food = create(:food)
      expected_response = "Successfully added #{food.name} to #{meal.name}"

      post "/api/v1/meals/#{meal.id}/foods/#{food.id}"
      result = JSON.parse(response.body)

      expect(meal.foods).to include(food)
      expect(result["message"]).to eq(expected_response)
    end

    it 'will return 404 status if meal or food does not exist' do
      non_existant_meal_id = 765859750
      food = create(:food)

      post "/api/v1/meals/#{non_existant_meal_id}/foods/#{food.id}"
    end
  end
end
