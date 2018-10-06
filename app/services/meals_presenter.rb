class MealsPresenter
  def jsonable_array
    fetched_meals.map do |meal|
      {
        id:    meal.id,
        name:  meal.name,
        foods: foods_array(meal)
      }
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

  def fetched_meals
    Meal.includes(:foods).all
  end
end