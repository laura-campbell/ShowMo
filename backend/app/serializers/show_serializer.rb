class ShowSerializer < ActiveModel::Serializer
  attributes :id, :artist, :venue, :attends, :rating, :date, :time
end
