class FoodUpdater
  attr_reader :id, :new_name, :new_calorie_count
  def initialize(food_id, new_attributes)
    @id = food_id[:food_id]
    @new_name = new_attributes[:name]
    @new_calorie_count = new_attributes[:calories]
  end

  def result
    if @new_name && @new_calorie_count
      {
        id: updated_food.id,
        name: updated_food.name,
        calories: updated_food.calories
      }
    else
      { error: "invalid parameters" }
    end
  end

  def status
    if @new_name && @new_calorie_count
      200
    else
      400
    end
  end

  private

  def food
    @food ||= Food.find_a_food(@id)
  end

  def updated_food
    @updated_food ||= food.update_a_food(@new_name, @new_calorie_count)
  end
end