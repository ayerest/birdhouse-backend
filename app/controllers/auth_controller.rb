class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({user_id: @user.id})
            if !!@user.last_login
                badges = @user.badges.map do |badge|
                    badge.category
                end
                
                if @user.last_login + 7.days > Time.now
                    if !badges.include?("Login")
                        Badge.create(category: "Login", medal: "Bronze", user: @user)
                    else
                        @user.badges.map do |badge|
                            if badge.category == "Login" && badge.medal == "Bronze"
                                if badge.created_at + 7.days < Time.now
                                    badge.update(medal: "Silver")
                                end
                            elsif badge.category == "Login" && badge.medal == "Silver"
                                if badge.created_at + 7.days < Time.now
                                    badge.update(medal: "Gold")
                                end
                            end
                        end
                    end
                end
            end

            # @user.update(last_login: Time.now)
            render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end