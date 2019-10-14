class BirdImagesController < ApplicationController

    def get_my_birds
        user = User.find((params[:user][:id]))
        birds = user.my_birds
        render :json => birds
    end

end
