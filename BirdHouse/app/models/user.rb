class User < ApplicationRecord
    has_many :field_entries
    has_many :badges
    has_many :bird_entries, through: :field_entries
    has_many :images, through: :field_entries

    def my_birds
        self.bird_entries.collect do |bird_entry|
            bird_entry.birds
        end
    end
end
