class UsersController < ApplicationController
    before_action :authenticate_user!

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render "edit"
        end
    end
    
    def edit
        @user = current_user
    end

    def show
        @user = current_user
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :status, :profile_image)
        end

end
