class Api::V1::MealFoodsController < ApplicationController
  def create
    meal_food_creator = MealFoodCreator.new(meal_food_params)
    render json:   meal_food_creator.message,
           status: meal_food_creator.status
  end

  private
  
  def meal_food_params
    params.permit(:meal_id, :food_id)
  end
end