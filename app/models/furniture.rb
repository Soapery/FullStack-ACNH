class Furniture < ApplicationRecord
  has_many :player_home, through: :home_furniture

  validates :name, :variation, :pattern, :price, :DIY, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
