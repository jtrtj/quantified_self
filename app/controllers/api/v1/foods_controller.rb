class Api::V1::FoodsController < ApplicationController
  def index
    render json: FoodsPresenter.jsonable_hash
  end

  def show
    food_presenter = FoodPresenter.new(food_params)
    render json:   food_presenter.jsonable_hash,
           status: food_presenter.message
  end
end