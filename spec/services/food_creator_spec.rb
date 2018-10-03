require 'rails_helper'

describe FoodCreator do
  context 'attributes' do
    it 'has a name and calories' do
      food_name = Faker::Hipster.word
      food_calories = Faker::Number.number(3)
      params = { name: food_name, calories: food_calories }
      creator = FoodCreator.new(params)

      expect(creator.name).to eq(food_name)
      expect(creator.calories).to eq(food_calories)
    end
  end

  context 'instance methods' do
    it '#result - returns the result of attempting to create a new food' do
      food_name = Faker::Hipster.word
      food_calories = Faker::Number.number(3)
      params = { name: food_name, calories: food_calories }
      creator = FoodCreator.new(params)
      result = creator.result
      
      expect(result).to have_key(:id)
      expect(result).to have_key(:name)
      expect(result).to have_key(:calories)
    end
  end
end