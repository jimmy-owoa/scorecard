# app/models/score.rb
class Score < ApplicationRecord
  # Un score pertenece a un juego
  belongs_to :game
  # Un score pertenece a un jugador
  belongs_to :player
  # Un score pertenece a un hoyo
  belongs_to :hole
end
