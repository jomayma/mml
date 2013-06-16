Feature: User can manually add book

Scenario: Add a book
  Given I am logged in as "Jorge"
  And I am on the books home page
  When I follow "Add New Book"
  Then I should be on the Create New Book page
  When I fill in "Title" with "The Hobbit"
  And I press "Save Changes"
  Then I should be on the books home page
  And I should see "The Hobbit"
