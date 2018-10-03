class Food < ApplicationRecord
  validates_presence_of :name,
                        :calories

  def self.fetch_all
    Food.all.to_a
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

  def update_a_food(new_name, new_calorie_count)
    updated_food = Food.find_by_id(self.id)
    updated_food.update(name: new_name, calories: new_calorie_count)
    updated_food
  end
end
