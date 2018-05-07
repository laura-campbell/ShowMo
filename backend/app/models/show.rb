class Show < ApplicationRecord
  belongs_to :artist
  belongs_to :venue
  has_many :attends
  has_many :users, through: :attends 
end
