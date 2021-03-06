Feature: Backlog Item

  Background:
    Given I am logged in

  Scenario: View item
    Given a backlog item exists
    When I view the item
    Then I should see the name of the item
    And I should see the name of the item in the title
    And I should see the description of the item
    And I should see when the item was created
    And I should see who created the item
    And I should see when the item was last updated
    And I should see who updated the item
    And I should see the status of the item
    And I should see the item discussion
    And I should see the checklist for the item
    And I should see who is working on the item

  @javascript
  Scenario: Remove item
    Given a backlog item exists
    And I view the item
    When I remove the item
    Then the backlog item should be removed

  Scenario: Complete checklist item
    Given a backlog item exists
    And I view the item
    When I complete a checklist item
    Then the item should be completed

  @javascript
  Scenario: Add checklist item
    Given a backlog item exists
    And I view the item
    When I add a checklist item
    Then the new item should exist

  @javascript
  Scenario: Edit checklist item
    Given a backlog item exists
    And I view the item
    When I edit a checklist item
    Then the checklist item should be different

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

  @javascript
  Scenario: Edit title
    Given a backlog item exists
    And I view the item
    When I edit the item name
    Then the item name should be different

  @javascript
  Scenario: Add comment
    Given a backlog item exists
    And I view the item
    When I add a comment
    Then the new comment should exist
