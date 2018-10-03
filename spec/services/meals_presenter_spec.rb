require 'rails_helper'

describe MealsPresenter do
  context 'class methods' do
    it '.jsonable_array - returns a json object containing all meals and their foods' do
      meals = create_list(:meal, 3)
      foods = create_list(:food, 10)
      create_list(:meal_food, 15, meal: meals.sample, food: foods.sample)
      
      jsonable_array = MealsPresenter.jsonable_array

      expect(jsonable_array).to be_an(Array)
      expect(jsonable_array.first).to have_key(:id)
      expect(jsonable_array.first).to have_key(:name)
      expect(jsonable_array.first).to have_key(:foods)
      expect(jsonable_array.first[:foods]).to be_an(Array)
    end
  end
end