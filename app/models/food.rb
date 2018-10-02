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
end
