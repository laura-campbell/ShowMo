class ShowSerializer < ActiveModel::Serializer
  belongs_to :artist
  belongs_to :venue
  has_many :attends
  attributes :id, :artist, :venue, :attends, :rating
end
