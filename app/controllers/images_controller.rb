class ImagesController < ApplicationController

    def get_my_photos
        user = User.find((params[:user][:id]))
        images = user.images
        render :json => images
    end

    def index
        images = Image.all
        render :json => images
    end
    
    def new
    end


    def show
        image = Image.find(params[:id])
        render :json => image
    end

    def destroy
        ##stuff goes here
    end
end
