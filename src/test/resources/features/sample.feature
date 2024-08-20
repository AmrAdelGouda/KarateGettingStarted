Feature: Samples

  Scenario: Get Sample 2
    Given url baseurl
    And path '/api/users?page=3'
    When method GET
    Then status 200

  Scenario: Get Sample
    Given url baseurl
    And path '/api/users?page=2'
    When method GET
    Then status 200
    And match $.data[0].last_name == 'Lawson'

  Scenario: Post Request Sample - Failure Case
    Given url baseurl
    And path '/api/register'
    And request
    """
      {
         "email": "sydney@fife"
      }
    """
    When method POST
    Then status 200

  Scenario: Post Request Sample - Success Case
    Given url baseurl
    And path '/api/register'
    And request
    """
      {
         "email": "sydney@fife"
      }
    """
    When method POST
    Then status 400

  Scenario: Post Request Sample - Data from External File
    Given url baseurl
    And print '************************************* ' + baseurl
    And path '/api/register'
    And request read('classpath:testData/DataForPostRequest.json')
    When method POST
    Then status 400
    And match $.error == 'Missing password'

  Scenario: generate Token
    Given url baseurl
    And path '/api/login'
    And request
    """
      {
         "email": "eve.holt@reqres.in",
         "password": "cityslicka"
      }
    """
    When method POST
    Then status 200
    And match $.token != null
    And def GeneratedToken = $.token
    And print '********* Generated Token is : ' + GeneratedToken +' *********'
