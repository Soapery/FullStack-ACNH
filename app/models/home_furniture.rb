class HomeFurniture < ApplicationRecord
  has_many :player_home
  has_many :furniture
end
