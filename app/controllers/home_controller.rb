class HomeController < ApplicationController
  # user don't have to be logged in this page!
  skip_before_filter :set_current_user
  before_filter :get_current_user
  
  def index
  end
  
  def top_books
    #@books = Book.all
    @books = Book.getTopBooks
  end
  
end
