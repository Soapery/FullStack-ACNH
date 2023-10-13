class PlayerHome < ApplicationRecord
  belongs_to :player
  has_many :furniture, through: :home_furniture

  validates :player_id, :size, :home_value, presence: true
  validates :size,
            inclusion: { in:      ["Small", "Medium", "Large"],
                         message: "must be Small, Medium, or Large" }
end
