class User < ApplicationRecord
    has_many :field_entries
    has_many :badges
    has_many :birds, through: :field_entries
    has_many :images, through: :field_entries
    validates :username, uniqueness: true
    has_secure_password

    def my_birds
        self.birds.sort_by do |bird|
            bird.common_name
        end
    end
end
