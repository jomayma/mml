class WelcomeController < ApplicationController
  # user don't have to be logged in this page!
  skip_before_filter :set_current_user
  
  def home
  end
end
