require 'rails_helper'

describe '/api/v1' do
  context 'DELETE /foods/:id' do
    it 'will detele the food with the id passed and return status code 204' do
      food_to_be_deleted = create(:food)

      delete "/api/v1/foods/#{food_to_be_deleted.id}"
    
      expect(status).to eq(204)
    end

    it "will return a 404 if food doesn't exist" do
      fake_id = 56432

      delete "/api/v1/foods/#{fake_id}"

      expect(status).to eq(404)
    end
  end
end
