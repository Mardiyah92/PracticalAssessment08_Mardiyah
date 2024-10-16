Feature: Get User Hash and Username

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = 'fb98bf8b0baa4e7e9eb1db36b92cfbc2'

  Scenario: Get username and has from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "mardiyah.rizka", "firstName": "Mardiyah", "lastName": "Rizka", "email": "mardiyah.rizka@gmail.com"}
    When method post
    Then status 200
    And print response