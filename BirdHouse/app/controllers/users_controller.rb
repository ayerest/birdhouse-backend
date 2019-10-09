class UsersController < ApplicationController

    def index
        users = User.all
        render :json => users
    end

    def new
    end

    def create
        ##stuff here
    end

    def show
        user = User.find(params[:id])
        render :json => user
    end


    def edit
    end

    def update
        ##stuff here
    end

end
