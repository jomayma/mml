class Review < ActiveRecord::Base
  belongs_to :book;
  belongs_to :reader;
  attr_protected :reader_id # see text
end
