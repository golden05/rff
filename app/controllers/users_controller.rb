class UsersController < ApplicationController

  before_action :admin_signed
  
  def index
    @users = User.all
  end

  def show

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

end
