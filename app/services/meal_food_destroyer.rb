class MealFoodDestroyer
  def initialize(meal_food_params)
    @meal_id = meal_food_params[:meal_id]
    @food_id = meal_food_params[:food_id]
  end

  def message
    if meal_food
      destroy_meal_food(meal_food)
      {
        message: "Successfully removed #{food.name} from #{meal.name}"
      }
    else
      {
        error: "meal or food not found"
      }
    end
  end

  def status
    if meal_food
      200
    else
      404
    end
  end

  private

  def meal_food
    @meal_food ||= MealFood.find_by(meal_id: @meal_id, food_id: @food_id)
  end

  def destroy_meal_food(meal_food)
    MealFood.destroy(meal_food.id)
  end

  def food
    @food ||= Food.find_by_id(@food_id)
  end
  
  def meal
    @meal ||= Meal.find_by_id(@meal_id)
  end
end