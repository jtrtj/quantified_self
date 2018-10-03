require 'rails_helper'

describe '/api/v1' do
  context 'DELETE /foods/:id' do
    it 'will detele the food with the id passed and return status code 204' do
      food_to_be_deleted = create(:food)

      delete "/api/v1/foods/#{food_to_be_deleted.id}"
      result = JSON.parse(response.body)
      expect(status).to eq(204)
      expect(result["message"]).to eq("food with id #{food_to_be_deleted.id} has been deleted")
    end
  end
end
