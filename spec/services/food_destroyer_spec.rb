require 'rails_helper'

describe FoodDestroyer do
  context 'attributes' do
    it 'gets an id from the parameters' do
      food_to_destroy = create(:food)
      food_params = { id: food_to_destroy.id }
      destroyer = FoodDestroyer.new(food_params)

      expect(destroyer.id).to eq(food_to_destroy.id)
    end
  end

  context 'instance methods' do
    it '#result - destroys the food and returns a message' do
      food_to_destroy = create(:food)
      food_params = { id: food_to_destroy.id }
      destroyer = FoodDestroyer.new(food_params)
      result = destroyer.result

      expect(result).to have_key(:message)
    end
  end
end