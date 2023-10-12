class PlayerHome < ApplicationRecord
  belongs_to :player
  has_one :home_furniture
end
