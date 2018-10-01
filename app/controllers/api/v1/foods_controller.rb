class Api::V1::FoodsController < ApplicationController
  def index
    render json: FoodsPresenter.jsonable_hash
  end
end