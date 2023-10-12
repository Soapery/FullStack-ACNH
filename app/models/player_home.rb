class PlayerHome < ApplicationRecord
  belongs_to :player
  has_many :furniture, through: :home_furniture
end
