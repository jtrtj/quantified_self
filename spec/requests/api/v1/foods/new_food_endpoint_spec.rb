require 'rails_helper'

describe '/api/v1' do
  context 'POST /foods' do
    it 'will create a new food item based on parameters and return a json object of that foods data' do
      food_name = Faker::Hipster.word
      food_calories = Faker::Number.number(3)
      parameters = { "food": { "name": food_name, "calories": food_calories } }

      post '/api/v1/foods', params: parameters
      status = response.status
      result = JSON.parse(response.body)

      expect(status).to eq(200)
      expect(result).to have_key("id")
      expect(result["name"]).to eq(parameters[:"food"][:"name"])
      expect(result["calories"]).to eq(parameters[:"food"][:"calories"].to_i)
    end

    it 'will return status 400 if parameters are invalid' do
      food_name = Faker::Hipster.word
      food_calories = Faker::Number.number(3)
      parameters = { "food": { "calories": food_calories } }

      post '/api/v1/foods', params: parameters
      status = response.status
      result = JSON.parse(response.body)

      expect(status).to eq(400)
      expect(result["error"]).to eq("invalid parameters")
    end
  end
end