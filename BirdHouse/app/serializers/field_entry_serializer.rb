class FieldEntrySerializer < ActiveModel::Serializer
  attributes :id, :notes, :date, :latitude, :longitude, :bird, :user, :images, :share, :uncertain
end
