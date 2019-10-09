class Image < ApplicationRecord
  belongs_to :field_entry
  has_many :bird_images
  has_many :birds, through: :bird_images
end
