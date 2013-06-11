Feature: User can add a review to a book

Scenario: Add a review
  Given I am on the books home page
  When I follow "Add New Book"
  Then I should be on the Create New Book page
  When I fill in "Title" with "The Hobbit"
  And I press "Save Changes"
  Then I should be on the books home page
  When I follow "More about The Hobbit"
  And I fill in "Comments" with "What a wonderful story!"
  And I press "Add review"
  Then I should see "Reviews counted: 1"
