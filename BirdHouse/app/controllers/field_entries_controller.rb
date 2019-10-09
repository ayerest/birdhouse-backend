class FieldEntriesController < ApplicationController

    def index
        field_entries = FieldEntry.all 
        render :json => field_entries
    end

    def new
    end

    def create
        ##stuff goes here
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

    
end
