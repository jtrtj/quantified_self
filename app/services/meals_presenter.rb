class MealsPresenter
  def jsonable_array
    fetched_meals.map do |meal|
      {
        id:    meal.id,
        name:  meal.name,
        foods: foods_array(meal.foods)
      }
    end
  end

  def foods_array(foods)
    foods.map do |food|
      {
        id:       food.id,
        name:     food.name,
        calories: food.calories
      }
    end
  end

  private

  def fetched_meals
    AllMealsFetcher.fetch
  end
end