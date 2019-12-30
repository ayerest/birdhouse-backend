class FactoidsController < ApplicationController

    def get_fact
        random_fact = Factoid.all.sample
        render :json => random_fact
    end
end
