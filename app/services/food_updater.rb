class FoodUpdater
  attr_reader :id, :new_name, :new_calorie_count
  def initialize(food_id, new_attributes)
    @id = food_id
    @new_name = new_attributes[:name]
    @new_calorie_count = new_attributes[:calories]
  end
end