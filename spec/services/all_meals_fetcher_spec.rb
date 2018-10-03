require 'rails_helper'

describe AllMealsFetcher do
  context 'class methods' do
    it '.fetch - returns an array of FetchedMeals' do
      fetched_meals = AllMealsFetcher.fetch

      expect(fetched_meals).to be_an(Array)
      expect(fetched_meals.sample).to be_a(FetchedMeal)
    end
  end
end