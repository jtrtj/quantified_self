class FoodPresenter
  attr_reader :id
  def initialize(food_params)
    @id = food_params[:id]
  end

  def jsonable_hash
    {
      id:       food.id,
      name:     food.name,
      calories: food.calories
    }
  end

  private

  def food
    @food ||= Food.find_a_food(@id)
  end
end