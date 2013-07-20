Feature: Backlog Item

  Scenario: View item
    Given a backlog item exists
    When I view the item
    Then I should see the name of the item
    And I should see the description of the item
    And I should see when the item was created
    And I should see when the item was last updated
    And I should see the status of the item
