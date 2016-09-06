class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  

  #Twitter Tutorial
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound # from StackOverflow http://stackoverflow.com/questions/8526082/couldnt-find-user-with-id-1
  end
  helper_method :current_user
  
end
