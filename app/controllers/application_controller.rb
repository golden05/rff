class ApplicationController < ActionController::Base

  def user_signed
    if !user_signed_in?
      redirect login_url, notice: "you are not login" 
    end
  end

  def user_signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  helper_method :user_signed_in?

  def admin_signed
    if !admin_signed_in?
      redirect_to login_url, notice: "you are not admin" 
    end
  end

  def admin_signed_in?
    if user_signed_in?
      user = User.find_by(id: session[:user_id])
      if user.admin
        return true
      end 
      return false
    end
    return false
  end

  helper_method :admin_signed_in?

  protect_from_forgery with: :exception
end
