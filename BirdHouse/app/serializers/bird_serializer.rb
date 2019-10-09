class BirdSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :species_name, :img_url, :birdcall, :region, :characteristics, :bird_entries, :bird_images, :images
end
