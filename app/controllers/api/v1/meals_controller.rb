class Api::V1::MealsController < ApplicationController
  def index
    render json: MealsPresenter.new.jsonable_array
  end

  def show
    meal_presenter = MealPresenter.new(meal_params)
    render json:   meal_presenter.jsonable_hash,
           status: meal_presenter.status
  end

  private

  def meal_params
    params.permit(:id)
  end
end