class Artist < ApplicationRecord
  has_many :fans
  has_many :users, through: :fans
  has_many :setlists
  has_many :shows
  has_many :venues, through: :shows
  has_many :attends, through: :shows
end
