class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  
  def create
    auth=request.env["omniauth.auth"]
    logger.debug "jmm - auth | #{auth}"
    user=Reader.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      Reader.create_with_omniauth(auth)
    session[:user_id] = user.id
    
    session[:access_token] = request.env['omniauth.auth']['credentials']['token']
    session[:access_secret] = request.env['omniauth.auth']['credentials']['secret']
    redirect_to show_path, notice: "Signed in"
  end
  
  def show
    logger.debug "jmm - begin SessionsController.create"
    if session['access_token'] && session['access_secret']
      @user = client.user(include_entities: true)
      logger.debug "jmm - @user | #{@user}"
    else
      redirect_to failure_path
      logger.debug "jmm - login failure"
    end
    
    redirect_to books_path
  end
  
  def error
    flash[:error] = "Sign in with Twitter failed"
    redirect_to books_path
  end
  
  def destroy
    :session.delete(:user_id)
    reset_session
    flash[:notice] = 'Logged out successfully.'
    redirect_to books_path
  end
end
