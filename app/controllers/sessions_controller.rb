class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      redirect_to admin_index_url, notice: "admin logined"
    else
      redirect_to login_url, notice: "user #{params[:name]} login failed"
    end
  end
end
