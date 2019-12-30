class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :user, :category, :medal, :updated_at
end
