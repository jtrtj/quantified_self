require 'rails_helper'

describe '/api/v1' do
  context  'GET /foods' do
    it 'returns a json object with all foods in the database' do
      banana = Food.create(name: 'Banana', calories: 150)
      cheetos = Food.create(name: 'Cheetos', calories: 200)

      get '/api/v1/foods'
      result = JSON.parse(response.body)

      expect(result.count).to eq(2)
      expect(result.first).to have_key("name") 
      expect(result.first).to have_key("calories") 
    end
  end 
end
