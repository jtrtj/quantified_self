require 'rails_helper'

describe '/api/v1' do
  context 'PATCH /foods/:id' do
    it 'will update the food specified in the parameters with the provided payload' do
      food_to_be_updated = create(:food)
      food_name_update = Faker::Hipster.word
      food_calories_update = Faker::Number.number(3)
      parameters = { "food": { "name": food_name_update, "calories": food_calories_update } }

      patch "/api/v1/foods/#{food_to_be_updated.id}", params: parameters
      result = JSON.parse(response.body)
      
      expect(status).to eq(200)
      expect(result["id"]).to eq(food_to_be_updated.id)
      expect(result["name"]).to eq(parameters[:"food"][:"name"])
      expect(result["calories"]).to eq(parameters[:"food"][:"calories"].to_i)
    end
  end
end