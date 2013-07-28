Feature: Backlog Item

  Scenario: View item
    Given a backlog item exists
    When I view the item
    Then I should see the name of the item
    And I should see the description of the item
    And I should see when the item was created
    And I should see who created the item
    And I should see when the item was last updated
    And I should see who updated the item
    And I should see the status of the item
    And I should see what projects the item belongs to
    And I should see the item discussion
    And I should see the position of the item in the backlog
    And I should see the checklist for the item
    And I should see who is working on the item

  Scenario: Complete checklist item
    Given a backlog item exists
    And I view the item
    When I complete a checklist item
    Then the item should be completed

  @javascript
  Scenario: Remove checklist item
    Given a backlog item exists
    And I view the item
    When I remove a checklist item
    Then the item should be removed

  @javascript
  Scenario: Edit description
    Given a backlog item exists
    And I view the item
    When I edit the item description
    Then the item description should be different
