class SessionsController < ApplicationController
  #TwitterTutorial
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    #raise :test
    session[:user_id] = @user.id
    redirect_to '/'
  end
    
  def destroy
    @current_user=nil
    session[:user_id]=nil
    @user=nil
    render "signout"
  end
  
    protected
    
    def auth_hash
      request.env['omniauth.auth']
    end
end

