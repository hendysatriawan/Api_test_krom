Feature: Pet

@Positive
Scenario: Get Pet Details by petId
    Given User has valid petId
    When User sends GET request to /pet/73943384
    Then Response Status code should be 200
    And Response should contain pet details
    And Response should contain status available
    And Response body should be valid JSON

@Negative
Scenario: Get Pet Details by invalid petId
    Given User has invalid petId
    When User sends GET request to /pet/9999999999
    Then Response Status code should be 404
    And Response should contain type error
    And Response should contain message "Pet not found"
    And Response body should be valid JSON
