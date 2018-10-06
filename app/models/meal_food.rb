class MealFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food, counter_cache: :meals_count
end
