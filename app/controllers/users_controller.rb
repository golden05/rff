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
      redirect_to users_path, notice: "#{user.name} was success created." 
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

  def workfor
    set_user
    @corps = @user.corps
  end

  def new_workfor
    @corps = Corp.all
  end

  def create_workfor
    corp = Corp.find(params[:SelectCorp])

  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end

end
