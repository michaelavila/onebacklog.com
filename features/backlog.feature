Feature: Backlog

  Scenario: View backlog
    Given a backlog item exists
    And another backlog item exists
    And I am logged in
    When I view the backlog
    Then I should see the item name
    And I should see the position of the item in the backlog
    And I should see a link to the item
    And the backlog is sorted

  Scenario: View empty backlog
    Given no backlog items
    And I am logged in
    When I view the backlog
    Then I should see the empty backlog message
