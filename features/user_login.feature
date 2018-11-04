Feature: User Login
  As a registered user
  I want to login when I visit the application
  So I can see all my pending work

  Scenario: User logs into the application
    Given I am the "User1" user
    When I am not logged in
    And I visit the show page for the Project with id="1"
    Then I should be redirected to the login page

