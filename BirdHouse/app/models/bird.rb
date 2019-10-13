class Bird < ApplicationRecord
    has_many :bird_entries
    has_many :field_entries, through: :bird_entries
    has_many :bird_images
    has_many :images, through: :bird_images

    ##method to only grab category names
    def self.get_categories 
        Bird.all.map do |bird|
            bird.category
        end.uniq
    end

    def self.get_birds_in_category(category)
        Bird.all.select do |bird|
            bird.category == category
        end
    end

    def self.filter_birds(searchTerm)
        Bird.all.select do |bird|
            bird.common_name.downcase.include?(searchTerm.downcase)
        end
    end

end
