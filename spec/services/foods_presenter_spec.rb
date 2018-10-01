require 'rails_helper'

describe FoodsPresenter do
  context 'instance methods' do

    let (:foods) { create_list(:food, 10) } 

    it '.all - returns an array of all foods in db' do
      presenter = FoodsPresenter.new
      expect(presenter.all).to be_an(Array)
      expect(presenter.all.count).to eq(10)
      expect(presenter.all[5]).to be_a(Food)
    end
  end
end
