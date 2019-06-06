class UsersController < ApplicationController
	def index
    @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
	end

	def show
    @user = User.find(params[:id])
	end

	def block_list
    @users = current_user.blockers.paginate(page: params[:page], per_page: 10)
  end
end
