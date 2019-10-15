class FieldEntriesController < ApplicationController

    def index
        field_entries = FieldEntry.all 
        render :json => field_entries
    end

    def new
    end

    def create
        user = User.find((params[:user][:id]))
        field_entry = FieldEntry.create(notes: get_params[:notes], user: user, date: get_params[:date], latitude: get_params[:latitude], longitude: get_params[:longitude])
        image = Image.create(img_url: params[:image], field_entry: field_entry)
        bird = Bird.find((params[:bird][:id]))
        field_entry.birds << bird
        badge_categories = user.badges.map do |badge|
            badge.category
        end
        if !badge_categories.include?("Sightings") && user.field_entries.length > 1 && user.field_entries.length < 5
            Badge.create(category: "Sightings", medal: "Bronze", user: user)
        elsif !badge_categories.include?("Birds") && user.my_birds.length > 1 && user.my_birds.length < 5
            Badge.create(category: "Birds", medal: "Bronze", user: user)
        end

        user.badges.each do |badge|
            if badge.category == "Sightings" && (badge.medal == "Bronze" && (user.field_entries.length >= 5 && user.field_entries.length < 10))
                badge.update(medal: "Silver")
            elsif badge.category == "Sightings" && (badge.medal == "Silver" && user.field_entries.length >= 10)
                badge.update(medal: "Gold")
            elsif badge.category == "Birds" && (badge.medal == "Bronze" && (user.my_birds.length >= 5 && user.my_birds.length < 10))
                badge.update(medal: "Silver")
            elsif badge.category == "Birds" && (badge.medal == "Silver" && user.my_birds.length >= 10)
                badge.update(medal: "Gold")
            end
        end
        
        byebug
        render :json => field_entry
    end

    def show
        field_entry = FieldEntry.find(params[:id])
        render :json => field_entry
    end

    def edit
    end

    def update
        ##stuff goes here
    end

    def destroy
        ##stuff goes here
    end

    private

    def get_params
        params.require(:field_entry).permit(:notes, :date, :latitude, :longitude, :image, :user)
    end

    
end
