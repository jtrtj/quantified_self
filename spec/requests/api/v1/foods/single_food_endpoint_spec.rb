require 'rails_helper'

describe 'api/v1' do
  context 'Get /foods/:id' do
    it "returns a json object containing a single food's data" do
      food_1 = create(:food)
      food_2 = create(:food)

      get "/api/v1/foods/#{food_1.id}"
      result = JSON.parse(response.body)

      expect(result).to have_key("id") 
      expect(result).to have_key("name") 
      expect(result).to have_key("calories") 
    end
  end
end
