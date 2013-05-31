class ReviewsController < ApplicationController
  def index
    id = params[:id] # retrieve book ID from URI route
    @reviews = Book.find(id).reviews
  end
  
  def show
    id = params[:id] # retrieve review ID from URI route
    @review = Review.find(id) # look up  by unique ID
    # will render app/views/reviews/show.html.haml by default
  end
  
  def new
    # default: render 'new' template
  end

  def create
    @review = Review.create!(params[:review])
    flash[:notice] = "#{@review.review} was successfully created."
    redirect_to books_path
  end
end
