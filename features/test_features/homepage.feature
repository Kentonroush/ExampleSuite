Feature: Homepage
  As a user of the demo website, I want to make sure the demo homepage is
  accessible and functions as expected

  Scenario: Homepage_Page can be navigated to
    When I navigate to test site
    Then I should be on the "Home" page

  # In this case, the test page is extremely simple, and a single variable would work fine.
  # The link/destination split is just to demonstrate how to format more complex scenarios.
  Scenario Outline: Homepage_Page navigation links lead to the expected pages
    When I navigate to test site
    And I click the homepage "<link>" link
    Then I should be on the "<destination>" page
  Examples:
    | link                | destination         |
    | A/B Testing         | A/B Testing         |
    | Add/Remove Elements | Add/Remove Elements |
