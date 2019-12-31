class BirdsController < ApplicationController
    ##get request to display categories on birdodex
    def get_categories
        categories = Bird.get_categories
        render :json => categories
    end

    #post request to grab birds in a particular category
    def show_birds
        test = get_params
        category = params[:category]
        birds = Bird.get_birds_in_category(category)
        birds = birds.map do |bird|
            {common_name: bird.common_name, species_name: bird.species_name, img_url: bird.img_url, id: bird.id, birdcall: bird.birdcall}
        end
        render :json => birds
    end
    
    def index
        birds = Bird.all 
        render :json => birds, except: [:details, :range_map]
    end

    def show
        bird = Bird.find(params[:id])
        render :json => bird
    end

    private

    def get_params
        params.permit(:user, :category)
    end

end
