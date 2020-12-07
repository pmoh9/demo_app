class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def curr_user
    @curr_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!curr_user
  end
  
  def user_req
    if !logged_in?
      flash[:danger] = "You must be logged in to proceed"
      redirect_to root_path
    end
  end
end
