class Furniture < ApplicationRecord
  has_many :player_homes, through: :home_furniture

  validates :name, :price, :diy, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
