class FieldEntriesController < ApplicationController

    def index
        field_entries = FieldEntry.all 
        render :json => field_entries
    end

    def new
    end

    def create
        user = User.find((params[:user][:id]))
        bird = Bird.find((params[:bird][:id]))
        puts user
        puts bird
        field_entry = FieldEntry.create(notes: get_params[:notes], user: user, bird: bird, date: get_params[:date], latitude: get_params[:latitude], longitude: get_params[:longitude], share: get_params[:share])
        if !!params[:image]
            image = Image.create(img_url: params[:image], field_entry: field_entry)
            user.images << image
        end
        badge_categories = user.badges.map do |badge|
            badge.category
        end

        if !badge_categories.include?("Sightings")
            if user.field_entries.length > 1 && user.field_entries.length < 5
                Badge.create(category: "Sightings", medal: "Bronze", user: user)
            elsif user.field_entries.length >= 5 && user.field_entries.length < 10
                Badge.create(category: "Sightings", medal: "Silver", user: user)
            elsif user.field_entries.length >= 10
                Badge.create(category: "Sightings", medal: "Gold", user: user)
            end
        end
        
        if !badge_categories.include?("Birds")
            if user.my_birds.length > 1 && user.my_birds.length < 5
                Badge.create(category: "Birds", medal: "Bronze", user: user)
            elsif user.my_birds.length >=5 && user.my_birds.length < 10
                Badge.create(category: "Birds", medal: "Silver", user: user)
            elsif user.my_birds.length >=10
                Badge.create(category: "Birds", medal: "Gold", user: user)
            end
        end

        user.badges.each do |badge|
            if badge.category == "Sightings" && (badge.medal == "Bronze" && (user.field_entries.length >= 5 && user.field_entries.length < 10))
                badge.update(medal: "Silver")
            end
            if badge.category == "Sightings" && (badge.medal == "Silver" && user.field_entries.length >= 10)
                badge.update(medal: "Gold")
            end
            if badge.category == "Birds" && (badge.medal == "Bronze" && (user.my_birds.length >= 5 && user.my_birds.length < 10))
                badge.update(medal: "Silver")
            end
            if badge.category == "Birds" && (badge.medal == "Silver" && user.my_birds.length >= 10)
                badge.update(medal: "Gold")
            end
        end
        
        render :json => field_entry
    end

    def show
        field_entry = FieldEntry.find(params[:id])
        render :json => field_entry
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def get_params
        params.require(:field_entry).permit(:notes, :date, :latitude, :longitude, :image, :user, :share)
    end

    
end
