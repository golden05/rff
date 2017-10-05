class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{params[:name]} logined"
      if admin_signed_in?
        redirect_to admin_index_url
      else
        redirect_to user_url(user)
      end 
    else
      redirect_to login_url, notice: "user #{params[:name]} login failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Thanks byebye"
  end 
end
