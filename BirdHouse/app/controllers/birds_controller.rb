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
        
        render :json => birds
    end
    
    def index
        birds = Bird.all 
        render :json => birds
    end

    def show
        bird = Bird.find(params[:id])
        render :json => bird
    end

    ##shouldn't need other controller actions for birds

    private

    def get_params
        params.permit(:user, :category)
    end

end
