class FoodDestroyer
  attr_reader :id
  def initialize(food_params)
    @id = food_params[:id]
  end

  def result
    if destroy_a_food
      { message: "food with id #{food.id} has been deleted" }
    else
      { error: "food cannot be found" }
    end
  end

  private

  def food
    @food ||= Food.find_a_food(@id)
  end

  def destroy_a_food
    if food
      Food.destroy_a_food(@food)
    else
      false
    end
  end
end