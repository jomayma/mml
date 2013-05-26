Feature: User can manually add book

Scenario: Add a book
  Given I am on the books home page
  When I follow "Add new book"
  Then I should be on the Create New Book page
  When I fill in "Title" with "The Hobbit"
  And I select "PG-13" from "Rating"
  And I press "Save Changes"
  Then I should be on the books home page
  And I should see "The Hobbit"
