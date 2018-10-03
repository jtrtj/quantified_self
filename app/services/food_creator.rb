class FoodCreator
  attr_reader :name, :calories
  def initialize(new_food_params)
    @name = new_food_params[:name]
    @calories = new_food_params[:calories]
  end

  def result
    if @name && @calories
      {
        id:       new_food.id,
        name:     new_food.name,
        calories: new_food.calories
      }
    else
      { error: "invalid parameters" }
    end
  end

  def status
    if @name && @calories
      200
    else
      400
    end
  end

  private

  def new_food
    @new_food ||= Food.create_new_food(@name, @calories)
  end
end