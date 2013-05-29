# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
more_books = [
  {:title => 'The Hobbit', :author => 'J.R.R. Tolkien', :summary => 'The story of a hobbit called Bilbo Bolson.'},
  {:title => 'El Ingenioso hidalgo Don Quijote de la Mancha', :author => 'Miguel de Cervantes Saavedra', :summary => 'Cuenta la historia del famoso hidalgo Don Quijote de la Mancha, y de su fiel escudero Sancho Panza.'},
  {:title => 'Luna Nueva', :author => 'Stepheny Meyer', :summary => 'A love story about vampires.'}
]
# NOTE: the following line temporarily allows mass assignment
# (needed if you used attr_accessible/attr_protected in book.rb)
Book.send(:attr_accessible, :title, :author, :summary)
more_books.each do |book|
Book.create!(book)
end
