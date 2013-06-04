class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  
  def create
    if session['access_token'] && session['access_secret']
      @user = client.user(include_entities: true)
      logger.debug "@user | #{@user}"
    end
    
    auth=request.env["omniauth.auth"]
    logger.debug "auth | #{auth}"
    user=Reader.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      Reader.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to books_path
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to books_path
  end
end
