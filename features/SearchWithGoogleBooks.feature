Feature: User can add book by searching for it using Google Book Database
 
  As a book reader
  So that I can add new books without manual tedium
  I want to add books by looking up their details in GoogleBooks
 
Scenario: Try to add nonexistent book (sad path)
 
  Given I am logged in as "Jorge"
  And I am on the books home page
  Then I should see "Add from GoogleBook"
  When I fill in "Search Terms" with "Book That Does Not Exist"
  And I press "Search GBook"
  Then I should be on the books home page
  And I should see "'Book That Does Not Exist' was not found in GoogleBooks."


