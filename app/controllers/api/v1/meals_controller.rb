class Api::V1::MealsController < ApplicationController
  def index
    render json: MealsPresenter.new.jsonable_array
  end
end