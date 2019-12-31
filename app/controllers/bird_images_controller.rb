class BirdImagesController < ApplicationController

    def get_my_birds
        user = User.find((params[:user][:id]))
        birds = user.my_birds
        birds = birds.map do |bird|
            {common_name: bird.common_name, species_name: bird.species_name, img_url: bird.img_url, id: bird.id, birdcall: bird.birdcall}
        end.uniq
        render :json => birds
    end

end
