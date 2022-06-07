Feature: Articles

  Background: 
    Given url BaseUrl
    * def ArticleRequestBody = read('classpath:RequestTemplate/ArticlesRequest.json')
    * def ArticleExpectedResponse = read('classpath:ResponseTemplate/CreateArticleResponse.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * set ArticleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set ArticleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set ArticleRequestBody.article.body = dataGenerator.getRandomArticleValues().body
    # generate token
    * def LoginToken = call read('classpath:helpers/CreateToken.feature')
    * def authToken = LoginToken.response.user.token
    #set the headers
    * header content-type = 'application/json;charset=UTF-8'
    * header authorization = 'Token '+ authToken

  Scenario: Verify user can create a new article using api
    Given path 'articles'
    And request ArticleRequestBody
    When method Post
    Then status 200
    And match response == ArticleExpectedResponse
