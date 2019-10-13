class BirdEntriesController < ApplicationController

    def filter_birds
        searchTerm = params[:searchTerm]
        birds = Bird.filter_birds(searchTerm)
        render :json => birds
    end
end
