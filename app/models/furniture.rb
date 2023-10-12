class Furniture < ApplicationRecord
  has_many :player_home, through: :home_furniture
end
