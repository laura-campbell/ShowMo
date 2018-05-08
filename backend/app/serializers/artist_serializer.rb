class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :shows, :fans, :venues, :setlists, :attends
end
