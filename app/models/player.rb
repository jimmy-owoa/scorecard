# app/models/player.rb
class Player < ApplicationRecord
    # Un jugador puede tener muchos scores en diferentes juegos
    has_many :scores
    # Un jugador puede participar en muchos juegos
    has_many :games, through: :scores

    def full_name
      "#{first_name} #{last_name}"
    end
  end
  