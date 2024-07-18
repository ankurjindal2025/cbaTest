Feature: petstore swagger regression test 

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario Outline: verify api response on single and multiple input values in array for GET /pet/findByStatus
    Given path '/pet/findByStatus'
    And param p = <param>
    When method get
    Then status 200

Examples:
    | param      | 
    | ['available' ]     | 
    | ['available', 'pending'] | 
    | ['available', 'pending', sold] | 


 

  Scenario Outline: verify api response on empty input values in array for GET /pet/findByStatus
    Given path '/pet/findByStatus'
    And param p = <param>
    When method get
    Then status 200

Examples:
    | param      | 
    | [ '']     | 
   

 

  Scenario Outline: verify api response on empty input values in array for GET /pet/findByStatus
    Given path '/pet/findByStatus'
    And param p = <param>
    When method get
    Then status 200

Examples:
    | param      | 
    | [ '']     | 
   

  Scenario Outline: verify api response schema for GET /pet/findByStatus
    Given path '/pet/findByStatus'
    And param p = <param>
    When method get
    Then status 200
     * match each response == [{ id: '#number', category: {id: '#number', name: '#string'}, name: '#string', photoUrls: '#array', tags: '#array', status: '#string'}]

Examples:
    | param      | 
   | [ 'available']     | 
  

  Scenario Outline: verify api response code for GET /pet/pedid if pet found
    Given path '/pet/' + '<param>'
    #And param p = <param>
    When method get
    Then status 200

    Examples:

    | param      | 
    | 2    | 


    Scenario Outline: verify api response code for GET /pet/pedid if pet not found
    Given path '/pet/' + '<param>'
    #And param p = <param>
    When method get
    Then status 403

    Examples:

    | param      | 
    | 1    | 


     Scenario Outline: verify api response schema for GET /pet/pedid 
    Given path '/pet/' + '<param>'
    #And param p = <param>
    When method get
    Then status 200
 * match each response == [{ id: '#number', category: {id: '#number', name: '#string'}, name: '#string', photoUrls: '#array', tags: '#array', status: '#string'}]


    Examples:

    | param      | 
    | 2   | 