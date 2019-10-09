class BirdsController < ApplicationController
    def index
        birds = Bird.all 
        render :json => birds
    end

    def show
        bird = Bird.find(params[:id])
        render :json => bird
    end

    ##shouldn't need other controller actions for birds

end
