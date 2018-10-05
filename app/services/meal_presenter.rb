class MealPresenter
  def initialize(meal_params)
    @id = meal_params[:id]
  end

  def jsonable_hash
    if meal
      {
        id: meal.id,
        name: meal.name,
        foods: foods_array(meal)
      }
    else
      { error: "meal not found" }
    end
  end

  def status
    if meal
      200
    else
      404
    end
  end

  def foods_array(meal)
    meal.foods.map do |food|
      {
        id:       food.id,
        name:     food.name,
        calories: food.calories
      }
    end
  end

  private

  def meal
    @meal = Meal.find_by_id(@id)
  end
end