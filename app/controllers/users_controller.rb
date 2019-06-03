class UsersController < ApplicationController
	before_action :find_user, only: [:show, :block_list]

	def index
		@users = User.all
	end

	def show
    @user = find_user
	end

	def block_list
    @user  = find_user
    @users = @user.blockers
  end

  private
  def find_user
  	User.find(params[:id])
  end
end
