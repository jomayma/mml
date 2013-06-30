class Book < ActiveRecord::Base
  has_many :reviews;
  
  def self.find_in_gbooks( string )
    GoogleBooks.search(string)
  end
end
