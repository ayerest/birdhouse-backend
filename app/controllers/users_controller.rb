class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def index
        users = User.all
        render :json => users
    end
    
    def show
        user = User.find(params[:id])
        render :json => user
    end
    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        @user = User.create(username: user_params[:username], password: user_params[:password], avatar: user_params[:avatar], last_login: Time.now)

        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end



    def edit
    end

    def update
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :avatar, :step_count)
    end

end
