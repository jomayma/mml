class Book < ActiveRecord::Base
  has_many :reviews;
  
  def find_in_gbooks
  end
end
