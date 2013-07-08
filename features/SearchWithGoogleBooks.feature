Feature: User can add book by searching for it using Google Book Database
 
  As a book reader
  So that I can add new books without manual tedium
  I want to add books by looking up their details in GoogleBooks

Background: Start from the Search form on the home page

  Given I am logged in as "Jorge"
  And I am on the books home page
  Then I should see "Add from GoogleBook"

Scenario: Try to add nonexistent book (sad path)
 
  When I fill in "Add from GoogleBook" with "inauthor:zzzzzzzzzzzzzzzzzzzz"
  And I press "Search"
  Then I should be on the books home page
  And I should see "'inauthor:zzzzzzzzzzzzzzzzzzzz' was not found in GoogleBooks."

Scenario: Try to add existent book (happy path)
 
  When I fill in "Add from GoogleBook" with "intitle:El Quijote"
  And I press "Search"
  Then I should be on the Search Results page
  And I should not see "not found"
  And I should see "Don Quijote de La Mancha"

