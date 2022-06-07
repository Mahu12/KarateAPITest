Feature: Articles2

  Background: 
    Given url BaseUrl
    #define request and response templates
    * def RequestBody = read('classpath:RequestTemplate/ArticlesRequest.json')
    * def ExpectedResponse = read('classpath:ResponseTemplate/CreateArticleResponse.json')
    # define Autherization token
    * def Login = call read('classpath:helpers/CreateToken.feature')
    * def AuthToken = Login.response.user.token
    #define Headers
    * header content-type = 'application/json;charset=UTF-8'
    * header authorization = 'Token '+ AuthToken

  Scenario Outline: Verify that user can create and delete Article with Api
    Given path 'articles'
    And request RequestBody
    * set RequestBody.article.title = <title>
    * set RequestBody.article.description = <description>
    * set RequestBody.article.body = <body>
    When method Post
    Then status 200
    And match response == ExpectedResponse
    
    #delete url ends with the value of slug in create article response
    * header authorization = 'Token '+ AuthToken
    * def deleteid = response.article.slug
    * print deleteid
    Given path 'articles',deleteid
    When method Delete
    Then status 200

    Examples: 
      | title     | description      | body      |
      | 'GoodBad' | 'Iwilldieoneday' | 'Tension' |
