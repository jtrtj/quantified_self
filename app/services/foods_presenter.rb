class FoodsPresenter
  def self.jsonable_hash
    foods.map do | food |
      {
        id:       food.id,
        name:     food.name,
        calories: food.calories
      }
    end
  end

  def self.foods
    Food.fetch_all
  end
end