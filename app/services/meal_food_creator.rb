class MealFoodCreator
  def initialize(meal_food_params)
    @meal_id = meal_food_params[:meal_id]
    @food_id = meal_food_params[:food_id]
  end
  def message
    if meal && food
      create_meal_food
      {
        message: "Successfully added #{food.name} to #{meal.name}"
      }
    else
      {
        error: "meal or food not found"
      }
    end
  end

  def status
    if meal && food
      200
    else
      404
    end
  end

  private

  def create_meal_food
    MealFood.create(meal: meal, food: food)
  end

  def meal
    @meal ||= Meal.find_by_id(@meal_id)
  end

  def food
    @food ||= Food.find_a_food(@food_id)
  end
end