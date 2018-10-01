require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end
  
  context 'class methods' do
    it '.fetch_all - returns all foods in the db' do
      create_list(:food, 2)
      all_foods = Food.fetch_all

      expect(all_foods).to be_an(Array)
      expect(all_foods.count).to eq(2)
      expect(all_foods.first).to be_a(Food)
    end
  end
end
