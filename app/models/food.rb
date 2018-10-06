class Food < ApplicationRecord
  validates_presence_of :name,
                        :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods
  def self.fetch_all
    Food.all
  end

  def self.find_a_food(id)
    Food.find_by_id(id)
  end

  def self.create_new_food(name, calories)
    new_food = Food.create(
                            name:     name,
                            calories: calories
                          )
  end
  
  def self.destroy_a_food(food)
    Food.destroy(food.id)
  end

  def self.times_eaten_counts
    where('meals_count > 1')
    .order(meals_count: :desc)
    .limit(3)
    .pluck(:meals_count)
  end

  def update_a_food(new_name, new_calorie_count)
    updated_food = Food.find_by_id(self.id)
    updated_food.update(name: new_name, calories: new_calorie_count)
    updated_food
  end
end