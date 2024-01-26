Feature: Geolocation
  As a user of the demo website, I want to make sure the geolocation page actually
  displays my geolocation as expected.

  Scenario: Geolocation should be displayed accurately on request
    Given I navigate to test site
    And I click the homepage "Geolocation" link
    When I set my geolocation to "10", "5"
    And I click the geolocation "Where am I?" button
    Then my geolocation should be displayed as "10", "5"