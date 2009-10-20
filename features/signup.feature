Feature: Signing up
  In order to set up a shooter
  As a user
  I want to set up an account
  
  Scenario: Signing Up
    When I am on the home page
      And I follow "Sign Up"
      And I fill in "Email" with "paul@rslw.com"
      And I fill in "Password" with "monkeys"
      And I press "Ok, Sign me up"
    Then I should see "My Shooters"