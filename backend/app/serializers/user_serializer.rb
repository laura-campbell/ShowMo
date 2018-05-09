class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :attends, :fans, :shows, :artists, :venues
end
