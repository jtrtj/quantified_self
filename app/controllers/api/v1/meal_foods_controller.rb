class Api::V1::MealFoodsController < ApplicationController
  def create
    meal_food_creator = MealFoodCreator.new(meal_food_params)
    render json:   meal_food_creator.message,
           status: meal_food_creator.status
  end
end