require 'rails_helper'

describe FoodPresenter do
  context 'instance methods' do
    it '#jsonable_hash - returns a hash representing a single food in db' do
      food_1 = create(:food)
      food_params = {id: "#{food1.id}"}
      jsonable_hash = FoodPresenter.new(food_params)

      expect(jsonable_hash[:id]).to eq(food_1.id)
      expect(jsonable_hash[:name]).to eq(food_1.name)
      expect(jsonable_hash[:calories]).to eq(food_1.calories)
    end
  end
end