require 'rails_helper'

describe '/api/v1' do
  context 'Get /foods/:id' do
    it "returns a json object containing a single food's data" do
      food_1 = create(:food)
      food_2 = create(:food)

      get "/api/v1/foods/#{food_1.id}"
      status = response.status
      result = JSON.parse(response.body)

      expect(status).to eq(200)
      expect(result).to have_key("id") 
      expect(result).to have_key("name") 
      expect(result).to have_key("calories") 
    end

    it "returns status code 404 when the food doesn't exist" do
      invalid_id = 8974567432
      get "/api/v1/foods/#{invalid_id}"
      status = response.status

      expect(status).to eq(404)
    end
  end
end
