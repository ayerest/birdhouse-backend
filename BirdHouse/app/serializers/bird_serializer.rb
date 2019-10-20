class BirdSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :species_name, :img_url, :birdcall, :range_map, :details, :category, :field_entries, :bird_images, :images, :quick_info
end
