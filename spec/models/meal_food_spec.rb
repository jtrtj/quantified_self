require 'rails_helper'

RSpec.describe MealFood, type: :model do
  context 'validations' do
    it { should belong_to(:meal) } 
    it { should belong_to(:food).counter_cache(true) }
  end
end
