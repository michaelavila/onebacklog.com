Feature: Backlog

  Scenario: View backlog
    Given a backlog item exists
    And another backlog item exists
    And I am logged in
    When I view the backlog
    Then I should see the item name
    And I should see a link to the item
    And the backlog is sorted

  Scenario: View empty backlog
    Given no backlog items
    And I am logged in
    When I view the backlog
    Then I should see the empty backlog message

  @javascript
  Scenario: Remove backlog item
    Given a backlog item exists
    And I am logged in
    And I view the backlog
    When I remove an item from the backlog
    Then the backlog item should be removed
