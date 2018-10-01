class Api::V1::FoodsController < ApplicationController
  def index
    render json: FoodsPresenter.to_json
  end
end