class Venue < ApplicationRecord
  has_many :shows
  has_many :artists, through: :shows
  has_many :attends, through: :shows
end
