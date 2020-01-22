class ImagesController < ApplicationController

    def get_my_photos
        user = User.find((params[:user][:id]))
        images = user.images
        images = images.sort_by do |image|
            image['created_at']
        end.reverse
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
