Feature: Creating filters on a shooter
  In order to ignore payloads that I don't care about
  As a user
  I want to add filters to my shooters
  
  Scenario: Adding a filter
    Given a user "paul@rslw.com"
      And a shooter "Paul's Shooter" with payload "Lots of Chickens"
      And shooter "Paul's Shooter" belongs to "paul@rslw.com"
    When I log in as "paul@rslw.com"
      And I follow "My Shooters"
      And I follow "Paul's Shooter"
    When I fill in "muffler_pattern" with "/payload/"
      And I press "Save Filter"
    Then I should see "/payload/"
    
    When I follow "Delete"
    Then I should not see "/payload/"