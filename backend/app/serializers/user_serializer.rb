class UserSerializer < ActiveModel::Serializer
  has_many :attends
  has_many :fans
  has_many :shows
  has_many :artists
  has_many :venues
  attributes :id, :name, :attends, :fans, :shows, :artists, :venues
end
