class Api::V1::MealsController < ApplicationController
  def index
    render json: MealsPresenter.jsonable_array
  end
end