class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :field_entries, :bird_entries, :badges, :images
end
