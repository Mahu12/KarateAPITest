Feature: Test For Home Page

  Background: 
    Given url BaseUrl
    #set the headers
    * header content-type = 'application/json;charset=UTF-8'

  Scenario: Verify getTags API
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags == "#array"
    And match each response.tags == "#string"

  Scenario: Verify getArticles API
    * def timeValidator = read('classpath:helpers/timeValidator.js')
    Given path 'articles'
    Given params {limit:10,offset:0}
    When method Get
    Then status 200
    And match response.articles == "#array"
    And match response.articlesCount == "#number"
    And match each response..favorited == "#boolean"
    And match each response..bio == "##string"
