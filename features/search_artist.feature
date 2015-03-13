Feature: Search Artists
  In order to find an artist 
  As a visitor
  I want to search the Sony database

  Scenario: Artist Search
    Given I am on the home page
    Given I fill in "search"  with "Drake"
    When I press "submit"
    Then I should see search results


