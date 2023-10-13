class PlayerHome < ApplicationRecord
  belongs_to :player
  has_many :home_furnitures, dependent: :destroy
  has_many :furniture, through: :home_furnitures

  validates :player_id, :size, :home_value, presence: true
  validates :size,
            inclusion: { in:      ["Small", "Medium", "Large"],
                         message: "must be Small, Medium, or Large" }
end
