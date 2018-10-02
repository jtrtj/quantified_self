class FoodPresenter
  attr_reader :id
  def initialize(food_params)
    @id = food_params[:id]
  end

  def jsonable_hash
    if food
      {
        id:       food.id,
        name:     food.name,
        calories: food.calories
      }
    else
      { error: "food not found" }
    end
  end

  def status
    if food
      200
    else
      404
    end
  end
  
  private

  def food
    @food ||= Food.find_a_food(@id)
  end
end