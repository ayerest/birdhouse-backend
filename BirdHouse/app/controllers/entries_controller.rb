class EntriesController < ApplicationController


    def get_my_entries
        user = User.find((params[:user][:id]))
        field_entries = user.field_entries
        field_entries = field_entries.map do |field_entry|
            {birds: field_entry.birds.map{|bird| {common_name: bird.common_name, species_name: bird.species_name, birdcall: bird.birdcall}}, latitude: field_entry.latitude, longitude: field_entry.longitude, notes: field_entry.notes, images: field_entry.images, date: field_entry.date}
        end
        
        render :json => field_entries
    end

    private

    def get_params
        params.require(:field_entry).permit(:notes, :date, :latitude, :longitude, :image, :user)
    end

    
end
