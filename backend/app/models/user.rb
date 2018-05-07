class User < ApplicationRecord
  has_many :fans
  has_many :artists, through: :fans
  has_many :attends
  has_many :shows, through: :attends
end
