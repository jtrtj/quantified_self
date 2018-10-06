class FavoriteFoodsPresenter
  def jsonable_hash
    top_times_eaten_counts.map do | eaten_count |
      {
        timesEaten: eaten_count,
        foods: foods_eaten(eaten_count)
      }
    end
  end

  private
  def foods_eaten(meals_count)
    Food.where(meals_count: meals_count).map do | food |
      {
        name:           food.name,
        calories:       food.calories,
        mealsWhenEaten: food.meals.distinct.pluck(:name)
      }
    end
  end

  def top_times_eaten_counts
   Food.times_eaten_counts
  end
end