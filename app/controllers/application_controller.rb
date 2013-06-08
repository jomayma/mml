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
      logger.debug "jmm - ApplicationController.client :: config | #{config}"
    end
  end
  
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_reader ||= Reader.find_by_id(session[:user_id])

    redirect_to home_path and return unless @current_reader
  end
  
end
