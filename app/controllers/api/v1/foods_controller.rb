class Api::V1::FoodsController < ApplicationController
  def index
    foods = FoodsPresenter.new.all
    render json:   foods.to_json, 
           status: foods.message
  end
end