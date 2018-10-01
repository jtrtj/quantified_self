require 'rails_helper'

describe FoodsPresenter do
  context 'class methods' do
    it '.jsonable_hash - returns an array of all foods in db' do
      food_1 = create(:food)
      food_2 = create(:food)
      jsonable_hash = FoodsPresenter.jsonable_hash

      expect(jsonable_hash).to be_an(Array)
      expect(jsonable_hash.count).to eq(2)
      expect(jsonable_hash.first[:name]).to eq(food_1.name)
      expect(jsonable_hash.first[:id]).to eq(food_1.id)
    end
  end
end
