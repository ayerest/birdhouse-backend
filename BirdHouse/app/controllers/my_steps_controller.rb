class MyStepsController < ApplicationController

    # def get_my_steps
    #     user = User.find((params[:user][:id]))
    #     steps = user.step_count
    #     render :json => steps
    # end

    def update_steps
        user = User.find((params[:user][:id]))
        steps = params[:steps]
        # byebug
        user.update(step_count: (user.step_count + steps), last_login: Time.now)

        badge_categories = user.badges.map do |badge|
            badge.category
        end

        if !badge_categories.include?("Steps")
            if user.step_count > 1000 && user.step_count < 5000
                Badge.create(category: "Steps", medal: "Bronze", user: user)
            elsif user.step_count >= 5000 && user.step_count < 20000
                Badge.create(category: "Steps", medal: "Silver", user: user)
            elsif user.step_count >= 20000
                Badge.create(category: "Steps", medal: "Gold", user: user)
            end
        end

        user.badges.each do |badge|
            if badge.category == "Steps" && (badge.medal == "Bronze" && (user.step_count >= 5000 && user.step_count < 20000))
                badge.update(medal: "Silver")
            end
            if badge.category == "Steps" && (badge.medal == "Silver" && user.step_count >= 20000)
                badge.update(medal: "Gold")
            end
        end
        # byebug
        render :json => {newSteps: steps, totalSteps: user.step_count}
    end
end