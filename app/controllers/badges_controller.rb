class BadgesController < ApplicationController

    def index 
        badges = Badge.all 
        render :json => badges
    end

    def new
    end

    def get_my_badges
        user = User.find((params[:user][:id]))
        badges = user.badges
        # steps = params[:steps]
        # user.update(step_count: user.step_count + steps)
        # byebug
        render :json => badges
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

end
