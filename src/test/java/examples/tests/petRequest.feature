Feature: PET API Test

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"

  Scenario: Add a New Pet to the Store
    * def reqBody = {"id": 98765, "category": {"id": 98765, "name": "rara"}, "name": "doggie", "photoUrls": ["rara"], "tags": [{"id": 98765, "name": "rara"}], "status": "available"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Find Pet by Status
    When url "https://petstore.swagger.io/v2/pet/findByStatus?status=available"
    And method get
    Then print response
    And status 200

  Scenario: Find Pet by ID
    When url "https://petstore.swagger.io/v2/pet/98765"
    And method get
    Then print response
    And status 200

  Scenario: Update Existing Pet
    * def reqBody = {"id": 98765, "category": {"id": 98765, "name": "rara"}, "name": "doggie", "photoUrls": ["rara"], "tags": [{"id": 98765, "name": "rara"}], "status": "sold"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete Pet by ID
    * def reqHeader = {'api_key': 'spesial-key'}
    When url "https://petstore.swagger.io/v2/pet/1"
    And headers reqHeader
    And method delete
    Then print response
    And status 200