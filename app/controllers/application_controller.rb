class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def client
    logger.debug "jmm - begin ApplicationController.client"
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    logger.debug "jmm - config | #{config}"
  end
end
