class AllMealsFetcher
  def self.fetch
    meals_from_db.map do |dbmeal|
      FetchedMeal.new(dbmeal)
    end
  end

  def self.meals_from_db
    Meal.all
  end
end