class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else 
            render error: { error: 'Unable to create User.'},status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
