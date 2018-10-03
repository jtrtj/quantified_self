require 'rails_helper'

describe '/api/v1' do
  context 'GET /meals' do
    it 'will return all the meals in the database along with their foods' do
      meals = create_list(:meal, 3)
      foods = create_list(:food, 10)
      create_list(:meal_food, 15, meal: meals.sample, food: foods.sample)
      
      get '/api/v1/meals'
      result = JSON.parse(response.body)

      expect(result).to be_an(Array)
      expect(result.count).to be >= 1
      expect(result.first).to have_key(:"id")
      expect(result.first).to have_key(:"name")
      expect(result.first).to have_key(:"foods")
      expect(result.last[:"foods"]).to be_an(Array)
      expect(result.last[:"foods"].first).to have_key(:"id")
      expect(result.last[:"foods"].first).to have_key(:"name")
      expect(result.last[:"foods"].first).to have_key(:"calories")
    end
  end
end
