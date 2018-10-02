require 'rails_helper'

describe FoodPresenter do
  context 'attributes' do
    it 'get a food id from the request params' do
      food_params = { id: 1 }
      presenter = FoodPresenter.new(food_params)

      expect(presenter.id).to eq(food_params[:id])
    end
  end

  context 'instance methods' do
    it '#jsonable_hash - returns a hash representing a single food in db' do
      food_1 = create(:food)
      food_params = {id: "#{food_1.id}"}
      presnter = FoodPresenter.new(food_params)
      jsonable_hash = presnter.jsonable_hash

      expect(jsonable_hash[:id]).to eq(food_1.id)
      expect(jsonable_hash[:name]).to eq(food_1.name)
      expect(jsonable_hash[:calories]).to eq(food_1.calories)
    end
  end
end