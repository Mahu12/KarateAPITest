Feature: Create Token

Background:
Given url BaseUrl

Scenario: Create Token
Given path 'users/login'
And request {"user": {"email":"#(userEmail)","password":"#(userPassword)"}}
When method Post
Then status 200
* def authToken = response.user.token
* print authToken





