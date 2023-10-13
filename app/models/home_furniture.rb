class HomeFurniture < ApplicationRecord
  belongs_to :player_home
  belongs_to :furniture

  validates :player_home_id, :furniture_id, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def remove_if_amount_zero
    return unless amount <= 0

    destroy
  end
end
