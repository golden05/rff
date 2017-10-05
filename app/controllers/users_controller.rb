class UsersController < ApplicationController

  before_action :admin_signed, except: [:show, :edit, :update]
  before_action :user_signed, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    set_user  
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
    set_user
  end

  def update
    set_user 
    @user.update(user_params)
    redirect_to user_path(@user), notice: "#{@user.name} was success updated."
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end

end
