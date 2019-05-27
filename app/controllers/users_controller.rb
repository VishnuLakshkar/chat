class UsersController < ApplicationController
  before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
    @user = User.find(params[:id])
	end

	def block_list
    @user  = User.find(params[:id])
    @users = @user.blockers
  end
end
