class Api::V1::FavoriteFoodsController < ApplicationController
  def index
    render json: FavoriteFoodsPresenter.new.jsonable_hash
  end
end