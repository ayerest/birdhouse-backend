class User < ApplicationRecord
    has_many :field_entries
    has_many :badges
    has_many :bird_entries, through: :field_entries
    has_many :images, through: :field_entries
    validates :username, uniqueness: true
    has_secure_password

    def my_birds
        self.bird_entries.collect do |bird_entry|
            bird_entry.bird
        end.uniq
    end
end
