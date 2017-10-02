class AdminController < ApplicationController

  def index
    if !admin_signed_in?
      if user_signed_in? 
        flash[:notice] = "You are not admin"
      else  
        flash[:notice] = "you have not login"
      end
      redirect_to login_url
    else 
      render
    end
  end
end
