Feature: Webhooks
  In order to notify my third party service
  As a user
  I want to post my payload to a third party service

  Scenario: Adding a filter
    Given a user "paul@rslw.com"
      And a shooter "Paul's Shooter" with payload "Lots of Chickens"
      And shooter "Paul's Shooter" belongs to "paul@rslw.com"
    When I log in as "paul@rslw.com"
      And I follow "My Shooters"
      And I follow "Paul's Shooter"
    When I fill in "webhook_url" with "http://www.google.com"
      And I press "Save Webhook"
    Then I should see "http://www.google.com"

    When I follow "Delete"
    Then I should not see "http://www.google.com"