Feature: Payload API
  In order to receive a notification about my event
  As a user
  I want to post a payload to the API
  
  Background:
    Given a user "paul@rslw.com"
      And a shooter "Paul's Shooter"
      And shooter "Paul's Shooter" belongs to "paul@rslw.com"
      
  Scenario: Posting a payload when there's none
    Given shooter "Paul's Shooter" has no payload
    When I post "bananas" to shooter "Paul's Shooter"
    Then I should see "OK, payload added"
    
  Scenario: Posting a payload when there's something
    Given shooter "Paul's Shooter" has payload "already have bananas"
      And I post "bananas" to shooter "Paul's Shooter"
    Then I should see "Sorry, payload rejected"
    
  Scenario: Filtering
    Given shooter "Paul's Shooter" has no payload
      And a filter "bananas" on shooter "Paul's Shooter"
    When I post "bananas" to shooter "Paul's Shooter"
    Then I should see "Sorry, payload rejected"
  
  Scenario: Shooting
    Given shooter "Paul's Shooter" has no payload
    When I shoot "Paul's Shooter" via the API
    Then I should see "BANG! Payload killed"
      And shooter "Paul's Shooter" payload should be blank