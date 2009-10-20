Feature: Showing the payload or not
  In order to find out what happened
  As a user
  I want to see my payload
  
  In order to accept more payloads
  As a user
  I want to clear my current payload
  
  Background:
    Given a user "paul@rslw.com"
      And a shooter "Paul's Shooter" with payload "Lots of Chickens"
      And shooter "Paul's Shooter" belongs to "paul@rslw.com"
    When I log in as "paul@rslw.com"
      And I follow "My Shooters"
      And I follow "Paul's Shooter"
  
  Scenario: Viewing the payload
    Then I should see "Lots of Chickens"
    
  Scenario: Clearing the current payload
    When I press "Shoot!"
    Then I should not see "Lots of Chickens"