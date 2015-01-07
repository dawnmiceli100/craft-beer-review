class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  BEERS_PER_PAGE  = 10
  
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :brewery_plus_beer_name

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action."
      redirect_to root_path
    end  
  end 

  def access_denied
    flash[:error] = "You do not have permission to do that." 
    redirect_to root_path
  end  

  def brewery_plus_beer_name(beer)
    name = "#{beer.brewery.name} #{beer.name}"
  end   

end
