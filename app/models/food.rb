class Food < ApplicationRecord
  validates_presence_of :name,
                        :calories

  def self.fetch_all
    Food.all.to_a
  end
end
