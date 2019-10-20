class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :step_count, :last_login, :avatar, :field_entries, :birds, :badges, :images
end
