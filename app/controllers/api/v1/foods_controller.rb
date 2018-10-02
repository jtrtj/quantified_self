class Api::V1::FoodsController < ApplicationController
  def index
    render json: FoodsPresenter.jsonable_hash
  end

  def show
    food_presenter = FoodPresenter.new(food_params)
    render json:   food_presenter.jsonable_hash,
           status: food_presenter.status
  end

  def create
    food_creator = FoodCreator.new(new_food_params)
    render json:   food_creator.result,
           status: food_creator.status
  end

  private

  def food_params
    params.permit(:id)
  end

  def new_food_params
    params.require(:food).permit(:name, :calories)
  end
end