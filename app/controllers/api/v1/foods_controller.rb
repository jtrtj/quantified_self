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
    food_creator = FoodCreator.new(food_attribute_params)
    render json:   food_creator.result,
           status: food_creator.status
  end

  def update
    food_updater = FoodUpdater.new(food_params, food_attribute_params)
    render json:   food_updater.result,
           status: food_updater.status
  end

  def destroy
    food_destroyer = FoodDestroyer.new(food_params)
    render json: {},
           status: food_destroyer.run
  end

  private

  def food_params
    params.permit(:id)
  end

  def food_attribute_params
    params.require(:food).permit(:name, :calories)
  end
end