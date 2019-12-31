class BirdEntriesController < ApplicationController

    def filter_birds
        searchTerm = params[:searchTerm]
        birds = Bird.filter_birds(searchTerm)
        birds = birds.map do |bird|
            {common_name: bird.common_name, species_name: bird.species_name, img_url: bird.img_url, id: bird.id, birdcall: bird.birdcall}
        end.uniq
        render :json => birds
    end
end
