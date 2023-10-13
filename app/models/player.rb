class Player < ApplicationRecord
  has_one :player_home

  validates :username, :gender, :email, :birthday, :bells, presence: true
  validate :valid_birthday

  private

  def valid_birthday
    return unless birthday.present? && birthday > Date.current

    errors.add(:birthday, "You cant be born in the future. I've tried.")
  end
end
