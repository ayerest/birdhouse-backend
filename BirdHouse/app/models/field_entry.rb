class FieldEntry < ApplicationRecord
    belongs_to :user
    has_many :bird_entries
    has_many :birds, through: :bird_entries
    has_many :images
    has_many :bird_pics, through: :images
end
