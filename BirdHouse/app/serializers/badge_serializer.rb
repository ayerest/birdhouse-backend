class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :user, :category, :medal
end
