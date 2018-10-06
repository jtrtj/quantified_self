require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
    it { should have_many(:meals).through(:meal_foods) } 
  end
  
  context 'class methods' do
    it '.fetch_all - returns all foods in the db' do
      create_list(:food, 2)
      all_foods = Food.fetch_all

      expect(all_foods.count).to eq(2)
      expect(all_foods.first).to be_a(Food)
    end

    it '.find_a_food - returns a single food' do
      food_1 = create(:food)
      food_2 = create(:food)

      found_food = Food.find_a_food(food_1.id)
      expect(found_food).to eq(food_1)
    end

    it '.create_new_food(name, calories) - adds a new food to the database and returns that food' do
      name = Faker::Hipster.word
      calories = Faker::Number.number(3).to_i

      new_food = Food.create_new_food(name, calories)
      
      expect(new_food.name).to eq(name)
      expect(new_food.calories).to eq(calories)
      expect(new_food.id).to_not be(nil)
    end

    it '.destroy_a_food(food) - destroys provided food' do
      food_to_be_destroyed = create(:food)
      
      Food.destroy_a_food(food_to_be_destroyed)

      expect(Food.find_by_id(food_to_be_destroyed.id)).to be_nil
    end

    it '.times_eaten_counts - returns range of top three counts of food on meals' do
      food_1 = create(:food)
      food_2 = create(:food)
      food_3 = create(:food)
      meal_1 = create(:meal)
      meal_2 = create(:meal)
      meal_3 = create(:meal)
      create_list(:meal_food, 3, meal: meal_1, food: food_1)
      create_list(:meal_food, 3, meal: meal_1, food: food_2)
      create_list(:meal_food, 2, meal: meal_2, food: food_2)
      create_list(:meal_food, 1, meal: meal_3, food: food_3)
      
      expect(Food.times_eaten_counts).to eq([5,3,1])
    end
  end

  context 'instance methods' do
    it '#update_a_food(new_name, new_calorie_count)' do
      food_to_be_updated = create(:food)
      new_name = Faker::Hipster.word
      new_calorie_count = Faker::Number.number(3)

      updated_food = food_to_be_updated.update_a_food(new_name, new_calorie_count)

      expect(updated_food.name).to eq(new_name)
      expect(updated_food.calories).to eq(new_calorie_count.to_i)
    end
  end
end
