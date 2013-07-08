class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def user
    @books = @current_reader.books
  end
  
  def show
    id = params[:id] # retrieve book ID from URI route
    @book = Book.find(id) # look up book by unique ID
    params[:user_ip] = request.remote_ip
    params[:title] = @book.title
    @gbook = Book.get_first_in_gbooks(params)
    
    # will render app/views/books/show.html.haml by default
  end
  
  def new
    # default: render 'new' template
  end

  def new_from_gbdb
    params[:user_ip] = request.remote_ip
    @gbook = Book.get_first_in_gbooks(params)
    @book = Book.create({"title"=>@gbook["title"], "author"=>@gbook["author"], "summary"=>@gbook["summary"]})
    flash[:notice] = "#{@book.title} was successfully added."
  end
  
  def create
    @book = Book.create!(params[:book])
    flash[:notice] = "#{@book.title} was successfully created."
    redirect_to books_path
  end
  
  def search_gbdb
    params[:user_ip] = request.remote_ip
    @books = Book.find_in_gbooks(params)    
    if @books.first == nil
      flash[:warning] = "'#{params[:search_terms]}' was not found in GoogleBooks."
      redirect_to books_path
    end
  end
  
  def destroy
    id = params[:id] # retrieve book ID from URI route
    @book = Book.find(id) # look up book by unique ID
    #if @book.readers > 1
    
    title = @book.title;
    @book.destroy;
    flash[:notice] = "#{title} was successfully deleted."
    redirect_to books_path
  end
end
