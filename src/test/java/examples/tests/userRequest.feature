Feature: PET API Test - User

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Create User
    * def reqBody = {"id": 12345, "username": "rara", "firstName": "string", "lastName": "string", "email": "string", "password": "rara123", "phone": "string", "userStatus": 1}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get User by Username
    When url "https://petstore.swagger.io/v2/user/rara"
    And method get
    Then print response
    And status 200

  Scenario: Login
    When url "https://petstore.swagger.io/v2/user/login?username=rara&password=rara123"
    And method get
    Then print response
    And status 200

  Scenario: Updated User
    * def reqBody = {"id": 12345, "username": "mardiyah", "firstName": "string", "lastName": "string", "email": "string", "password": "mardiyah123", "phone": "string", "userStatus": 0}
    When url "https://petstore.swagger.io/v2/user/rara"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Logout
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200