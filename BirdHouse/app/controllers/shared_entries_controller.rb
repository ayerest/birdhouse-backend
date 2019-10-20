class SharedEntriesController < ApplicationController

    def get_shared_entries
        # byebug
        user = User.find((params[:user][:id]))
 
        shared_entries = FieldEntry.filter_public()
        if shared_entries.length > 0
            shared_entries = shared_entries.select do |entry|
                entry.date > (Time.now - 24.hours)
            end
            not_mine = shared_entries.select do |entry|
                entry.user != user
            end
            not_mine = not_mine.map do |entry|
                {bird: {birdcall: entry.bird.birdcall, category: entry.bird.birdcall, common_name: entry.bird.common_name, species_name: entry.bird.species_name, img_url: entry.bird.img_url}, date: entry.date, id: entry.id, images: entry.images, latitude: entry.latitude, longitude: entry.longitude, notes: entry.notes, share: entry.share, uncertain: entry.uncertain}
            end
            render :json => not_mine
        else
            render :json => {shared_entries: false}
        end
    end
end
