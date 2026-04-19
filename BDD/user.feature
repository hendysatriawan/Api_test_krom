Feature: User

@Positive
Scenario: Create a new user with valid data
    Given User has valid data
    When User sends a POST request to /user
    Then Response Status code should be 200
    And Response body should be valid JSON
    And Response should contain code,message and type

@Positive
Scenario: Login with valid data
    Given User has valid username and password
    When User sends a GET request to /user/login
    Then Response Status code should be 200
    And Response body should be valid JSON
    And Response should contain code, message and type
    And Response message should contain "logged in user session:"

@Positive
Scenario: Get user details with valid data
    Given User has valid username
    When User sends GET request to /user/{username}
    Then Response Status code should be 200
    And Response should contains user details
    And Response body should be valid JSON

@Positive
Scenario: Delete User with valid data
    Given User has valid username
    When User sends DELETE request to /user/{username}
    Then Response Status code should be 200
    And Response should contain message "{username}"
    And Response body should be valid JSON

@Negative
Scenario: Delete User with invalid data
    Given User has invalid username
    When User sends DELETE request to /user/{username}
    Then Response Status code should be 404

@Negative
Scenario: Get user details with invalid data
    Given User has invalid username
    When User sends GET request to /user/user20
    Then Response Status code should be 404
    And Response should contain message "User not found"
    And Response body should be valid JSON

@Negative
Scenario: Get user details with Symbol username
    Given User has invalid username
    When User sends GET request to /user/&^&%&%
    Then Response Status code should be 400
    And Response should contain "400 Bad Request"
    And Response body should not valid JSON
