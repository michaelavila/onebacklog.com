Feature: Backlog

  Scenario: View empty backlog
    Given no backlog items
    And I am logged in
    When I view the backlog
    Then I should see the item name
