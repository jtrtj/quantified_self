class Api::V1::FavoriteFoodsController < ApplicationController
  def index
    render json: FavoriteFoodsPresenter.jsonable_hash
  end
end