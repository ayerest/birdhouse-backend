class FieldEntrySerializer < ActiveModel::Serializer
  attributes :id, :notes, :date, :latitude, :longitude, :bird_entries, :birds, :user, :images, :bird_images
end
