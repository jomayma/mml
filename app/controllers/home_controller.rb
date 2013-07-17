class HomeController < ApplicationController
  # user don't have to be logged in this page!
  skip_before_filter :set_current_user
  before_filter :get_current_user
  
  def index
  end
  
  def top_books
    #@books = Book.all
    debugger
    @books = Book.connection.select_all("SELECT books.*, avg(reviews.stars) as avg_rating
      FROM books 
      INNER JOIN reviews ON books.id = reviews.book_id 
      group by books.id
      ORDER BY reviews.stars desc
      LIMIT 5")
  end
  
end
