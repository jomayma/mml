# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
more_books = [
  {:title => 'The Hobbit', :author => 'J.R.R. Tolkien', :rating => 'G', :release_date => '01/01/1930', :description => 'The story of a hobbit called Bilbo Bolson.'},
  {:title => 'El Ingenioso hidalgo Don Quijote de la Mancha', :author => 'Miguel de Cervantes Saavedra', :rating => 'R', :release_date => '01/01/1605', :description => 'Cuenta la historia del famoso hidalgo Don Quijote de la Mancha, y de su fiel escudero Sancho Panza.'},
  {:title => 'Luna Nueva', :author => 'Stepheny Meyer', :rating => 'G', :release_date => '01/01/2009', :description => 'A love story about vampires.'}
]
# NOTE: the following line temporarily allows mass assignment
# (needed if you used attr_accessible/attr_protected in book.rb)
Book.send(:attr_accessible, :title, :author, :rating, :release_date, :description)
more_books.each do |book|
Book.create!(book)
end
