class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    id = params[:id] # retrieve book ID from URI route
    @book = Book.find(id) # look up book by unique ID
    # will render app/views/books/show.html.haml by default
  end
  def new
    
  end
end
