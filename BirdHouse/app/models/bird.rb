class Bird < ApplicationRecord
    has_many :field_entries
    has_many :bird_images
    has_many :images, through: :bird_images
    has_many :users, through: :field_entries

    ##method to only grab category names
    def self.get_categories 
        Bird.all.map do |bird|
            bird.category
        end.uniq.sort
    end

    def self.get_birds_in_category(category)
        birds = Bird.all.select do |bird|
            bird.category == category
        end
        birds = birds.sort_by do |bird|
            bird.common_name.downcase
        end
        return birds
    end

    def self.filter_birds(searchTerm)
        by_name = Bird.all.select do |bird|
            bird.common_name.downcase.include?(searchTerm.downcase)
        end
        by_name = by_name.sort_by do |bird|
            bird.common_name.downcase
        end
        by_keyword = Bird.all.select do |bird|
            bird.details.downcase.include?(searchTerm.downcase) || bird.quick_info.downcase.include?(searchTerm.downcase)
        end
        by_keyword = by_keyword.sort_by do |bird|
            bird.common_name.downcase
        end
        if by_keyword.length > 50
            by_keyword = by_keyword.slice(0,49)
        end
        return by_name + by_keyword
    end

end
