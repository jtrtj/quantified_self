require 'rails_helper'

describe FoodUpdater do
  context 'attributes' do
    it 'has a food id, a new_name and a new calorie count' do
      food_to_be_updated = create(:food)
      food_id = { id: food_to_be_updated.id }
      food_attributes_update = { name: Faker::Hipster.word,
                                 calories: Faker::Number.number(3) 
                                }
      
      food_updater = FoodUpdater.new(food_id, food_attributes_update)

      expect(food_updater.id).to eq(food_id[:id])
      expect(food_updater.new_name).to eq(food_attributes_update[:name])
      expect(food_updater.new_calorie_count).to eq(food_attributes_update[:calories])
    end
  end

  context 'instance methods' do
    it '#result - returns the result of updating a food' do
      food_to_be_updated = create(:food)
      food_id = { id: food_to_be_updated.id }
      food_attributes_update = { name: Faker::Hipster.word,
                                 calories: Faker::Number.number(3) 
                                }
      
      food_updater = FoodUpdater.new(food_id, food_attributes_update)
      result = food_updater.result

      expect(result[:id]).to eq(food_to_be_updated.id)
      expect(result[:name]).to eq(food_attributes_update[:name])
      expect(result[:calories]).to eq(food_attributes_update[:calories].to_i)
     end
  end
end