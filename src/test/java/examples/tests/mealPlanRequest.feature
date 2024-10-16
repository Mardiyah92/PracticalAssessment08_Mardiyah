Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = 'fb98bf8b0baa4e7e9eb1db36b92cfbc2'
    * def hash = 'c15f6e11b633ea38fb713e1fdbdb534e0b87793c'
    * def username = 'mardiyah-rizka'
    * def startDate = '2024-10-01'

  Scenario: Generate Meal Plan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '2000'
    When method get
    Then status 200
    And print response

  Scenario: Adding To Meal Plan
    Given path 'mealplanner', username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {"date": 1727933688, "slot": 1, "position": 0, "type": "INGREDIENTS", "value": {"ingredients": [{"name": "1 banana"}]}}
    And method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: Add To Shopping List
    Given path 'mealplanner', username, 'shopping-list/items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {"item": "1 package baking powder", "aisle": "Baking", "parse": true}
    And method post
    Then status 200
    And print response

  Scenario: Get Shopping List
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  Scenario: ML Model Image Classification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://awsimages.detik.net.id/community/media/visual/2021/08/12/resep-spaghetti-saus-terong_43.jpeg?w=1200'
    When method get
    And status 200
    And print response