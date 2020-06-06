class ApplicationController < ActionController::Base
  helper_method :current_user
  def home
    redirect_to signup_path
  end

  private

  def current_user 
    @current_user ||= User.find_by_id(session[:id])  
  end 

  def logged_in? 
    !!current_user 
  end 

  def check_for_logged_in
    redirect_to 'application/home' if !logged_in?
  end
  
     
end
