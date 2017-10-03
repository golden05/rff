class ApplicationController < ActionController::Base

  def user_signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  def admin_signed
    if !admin_signed_in?
      flash[:notice] = "you are not admin"
      redirect_to login_url 
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

  protect_from_forgery with: :exception
end
