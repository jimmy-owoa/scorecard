# app/models/game.rb
class Game < ApplicationRecord
    has_many :scores
    has_many :players, through: :scores
    
    accepts_nested_attributes_for :scores

  end
  