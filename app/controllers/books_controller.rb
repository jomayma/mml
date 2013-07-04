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
    # default: render 'new' template
  end

  def new_from_gbdb
    isbn_book = params[:isbn]
    title_book = params[:title]
    book = Book.get_first_in_gbooks(params)
    @book = Book.create(book)
    flash[:notice] = "#{@book.title} was successfully added."
  end
  
  def create
    @book = Book.create!(params[:book])
    flash[:notice] = "#{@book.title} was successfully created."
    redirect_to books_path
  end
  
  def search_gbdb
    @books = Book.find_in_gbooks(params[:search_terms])    
    if @books.first == nil
      flash[:warning] = "'#{params[:search_terms]}' was not found in GoogleBooks."
      redirect_to books_path
    end
  end
end
