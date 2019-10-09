class ImagesController < ApplicationController
    def index
        images = Image.all
        render :json => images
    end
    
    def new
    end

    def create
        #stuff goes here
    end

    ##no edit/update feature

    def show
        image = Image.find(params[:id])
        render :json => image
    end

    def destroy
        ##stuff goes here
    end
end
