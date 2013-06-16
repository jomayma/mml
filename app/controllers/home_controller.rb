class HomeController < ApplicationController
  # user don't have to be logged in this page!
  skip_before_filter :set_current_user
  before_filter :get_current_user
  
  def index
  end
end
