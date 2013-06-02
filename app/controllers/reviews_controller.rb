class ReviewsController < ApplicationController
  def index
    id = params[:id] # retrieve review ID from URI route
    @reviews = Book.find(id).reviews
  end
  
  def show
    id = params[:book_id] # retrieve book ID from URI route
    @review = Review.find(id) # look up  by unique ID
    # will render app/views/reviews/show.html.haml by default
  end
  
  def new
    # default: render 'new' template
    @review = @book.reviews.build
  end

  def create
    # since reader_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.reader = @current_user.
    
    book_id = params[:book_id]
    @book = Book.find(book_id)
    logger.debug "params[:review] | #{params[:review]}"
    r = @book.reviews.build(params[:review])
    #@current_user.reviews << r
    redirect_to book_path(@book)
  end
end
