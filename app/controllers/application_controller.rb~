class ApplicationController < ActionController::Base
  before_filter :set_current_user
  protect_from_forgery

  private

  def client
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
  end
  
  protected # prevents method from being invoked by a route
  
  def get_current_user
    return @current_reader if defined?(@current_reader)
    #@current_reader = cookies[:token] && Reader.find_by_token(cookies[:token])
    if session[:user_id]
      @current_reader ||= Reader.find_by_id(session[:user_id])
    end
  end
  
  def set_current_user
    debugger
    # we exploit the fact that find_by_id(nil) returns nil
    @current_reader ||= Reader.find_by_id(session[:user_id])
    if @current_reader
      return
    else
      flash[:warning]= "You must login first"
      redirect_to home_path
    end
    #redirect_to home_path and return unless @current_reader
  end
  
end
