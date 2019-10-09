class BadgesController < ApplicationController

    def index 
        badges = Badge.all 
        render :json => badges
    end

    def new
    end

    def create
        ##stuff goes here
    end

    def show 
        badge = Badge.find(params[:id])
        render :json => badge
    end

    def edit
    end

    def update
        ##for medal upgrades
    end

    ##don't think there should be a destroy
end
