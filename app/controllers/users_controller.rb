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
    user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
    if user.save
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

end
