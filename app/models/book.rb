class Book < ActiveRecord::Base
  has_many :reviews;
  
  def self.find_in_gbooks( string )
    GoogleBooks.search(string)
  end
  
  def self.get_first_in_gbooks(params)
    debugger
    if params[:isbn]
      string = "isbn:#{params[:isbn]}"
    else
      string = "intitle:#{params[:title]}"
    end
    books = GoogleBooks.search(string)
    first_gbook = books.first
    
    #book = Book.new()
    
    #mapping some google books attributes into my model
    #book.title = first_gbook.title
    #book.author = first_gbook.authors
    #book.summary = first_gbook.description
    #"book"=>{"title"=>"The Adventures of Oliver Twist", "author"=>"Charles Dickens", "summary"=>""}
    
    book = {"title"=>first_gbook.title, "author"=>first_gbook.authors, "summary"=>first_gbook.description}
    
    return book
  end
end
