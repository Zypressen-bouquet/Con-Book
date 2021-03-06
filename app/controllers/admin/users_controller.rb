class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
    before_action :authenticate_admin!

	def index
		@users = User.page(params[:page]).per(10)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_users_path
        else
          flash[:user_updated_error] = "会員情報が正常に保存されませんでした。"
          redirect_to edit_admin_user_path(@user)
        end
    end

    private 
      def user_params
        params.require(:user).permit(:name, :status)
      end

end