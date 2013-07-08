class Book < ActiveRecord::Base

  has_many :reviews
  has_many :readers, through: :reviews
  
  def self.find_in_gbooks( params )
    books = GoogleBooks.search(params[:search_terms],{},params[:user_ip])
    
    return books
  end
  
  def self.get_first_in_gbooks(params)
    if params[:isbn]
      string = "isbn:#{params[:isbn]}"
    else
      string = "intitle:#{params[:title]}"
    end
    books = GoogleBooks.search(string,{:count => 1},params[:user_ip])
    first_gbook = books.first    
    book = {"title"=>first_gbook.title, "author"=>first_gbook.authors, "summary"=>first_gbook.description, "image_link"=>first_gbook.image_link}

    return book
  end

end
