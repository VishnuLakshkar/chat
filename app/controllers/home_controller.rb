class HomeController < ApplicationController
  def index
  	session[:conversations] ||= []

    @users = User.where.not(id: current_user).paginate(page: params[:page], per_page: 5)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
