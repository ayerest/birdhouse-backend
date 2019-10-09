class Bird < ApplicationRecord
    has_many :bird_entries
    has_many :field_entries, through: :bird_entries
    has_many :bird_images
    has_many :images, through: :bird_images
end
