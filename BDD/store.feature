Feature: Store

@Negative
Scenario: Get Order Details by invalid orderId
    Given User has invalid orderId
    When User sends GET request to /store/order/9999999999
    Then Response Status code should be 404
    And Response should contain type error
    And Response should contain message "Order not found"
    And Response body should be valid JSON