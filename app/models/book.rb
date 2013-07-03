class Book < ActiveRecord::Base
  has_many :reviews;
  
  def self.find_in_gbooks( string )
    GoogleBooks.search(string)
  end
  
  def self.get_first_in_gbooks(string)
    books = GoogleBooks.search(string)
    first_gbook = books.first
    
    book = Book.new()
    
    #mapping some google books attributes into my model
    book.title = first_gbook.title
    book.author = first_gbook.authors
    book.summary = first_gbook.description
    
    return book
  end
end
