class Bird < ApplicationRecord
    has_many :field_entries
    has_many :bird_images
    has_many :images, through: :bird_images
    has_many :users, through: :field_entries

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
        by_name = Bird.all.select do |bird|
            bird.common_name.downcase.include?(searchTerm.downcase)
        end
        by_keyword = Bird.all.select do |bird|
            bird.details.downcase.include?(searchTerm.downcase) || bird.quick_info.downcase.include?(searchTerm.downcase)
        end
        return by_name + by_keyword
    end

end
