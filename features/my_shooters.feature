Feature: Managing Shooters
  In order to create, view and edit shooters
  As a user
  I want to create shooters on my dashboard
  
  Scenario: Managing Shooters
    Given I am a logged in user
    When I am on the dashboard
      And I follow "Add a New Shooter"
      And I fill in "Name" with "My New Shooter"
      And I press "Shoot!"
    Then I should see "My New Shooter"
    
    When I follow "My Shooters"
      And I follow "Delete"
    Then I should not see "My New Shooter"