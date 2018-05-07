class ArtistSerializer < ActiveModel::Serializer
  has_many :shows
  has_many :fans
  has_many :venues
  has_many :setlists
  has_many :attends
  attributes :id, :name, :shows, :fans, :venues, :setlists, :attends
end
