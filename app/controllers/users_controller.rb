class UsersController < ApplicationController

  before_action :admin_signed
  
  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "#{user.name} was success created."
      redirect_to users_path 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "#{@user.name} was success updated."
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end

end
