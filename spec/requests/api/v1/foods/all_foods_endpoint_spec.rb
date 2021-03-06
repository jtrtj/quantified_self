require 'rails_helper'

describe '/api/v1' do
  context 'GET /foods' do
    it 'returns a json object with all foods in the database' do
      create_list(:food, 10)

      get '/api/v1/foods'
      result = JSON.parse(response.body)

      expect(result.count).to eq(10)
      expect(result.first).to have_key("id") 
      expect(result.first).to have_key("name") 
      expect(result.first).to have_key("calories") 
    end
  end 
end
