class EntriesController < ApplicationController


    def get_my_entries
        user = User.find((params[:user][:id]))
        field_entries = user.field_entries
        render :json => field_entries
    end

    private

    def get_params
        params.require(:field_entry).permit(:notes, :date, :latitude, :longitude, :image, :user)
    end

    
end
