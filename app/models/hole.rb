# app/models/hole.rb
class Hole < ApplicationRecord
    # Si estás rastreando scores específicos de cada hoyo
    has_many :scores
  end
  