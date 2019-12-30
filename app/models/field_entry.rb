class FieldEntry < ApplicationRecord
    belongs_to :user
    belongs_to :bird
    has_many :images
    has_many :bird_pics, through: :images

    def self.filter_public
        FieldEntry.all.select do |field_entry|
            field_entry.share == true
        end
    end
end
