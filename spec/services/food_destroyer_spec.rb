require 'rails_helper'

describe FoodDestroyer do
  context 'attributes' do
    it 'gets an id from the parameters' do
      food_to_destroy = create(:food)
      food_params = { food_id: food_to_destroy.id }
      destroyer = FoodDestroyer.new(food_params)

      expect(destroyer.id).to eq(food_to_destroy.id)
    end
  end

  context 'instance methods' do
    it '#run - destroys the food and returns a message' do
      food_to_destroy = create(:food)
      food_params = { food_id: food_to_destroy.id }
      destroyer = FoodDestroyer.new(food_params)
      destroy = destroyer.run

      expect(destroy).to eq(204)
    end
  end
end