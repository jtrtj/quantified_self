class FoodDestroyer
  attr_reader :id
  def initialize(food_params)
    @id = food_params[:id]
  end

  def run
    if destroy_a_food
      204
    else
      404
    end
  end

  private

  def food
    @food ||= Food.find_a_food(@id)
  end

  def destroy_a_food
    if food
      Food.destroy_a_food(food)
      true
    else
      false
    end
  end
end