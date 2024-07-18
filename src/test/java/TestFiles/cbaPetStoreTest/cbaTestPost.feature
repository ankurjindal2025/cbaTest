
  Feature: petstore swagger regression test  for post api

  Background:
    * url 'https://petstore.swagger.io/v2/'

Scenario : verify post api response and schema for  /v2/pet


Given path 'pet'
And request {
id: 7,
  category: {
    id: 7,
    name: "AnkurTest"
  },
  name: "AnkurTest",
  photoUrls: [
    "AnkurTest"
  ],
  tags: [
    {
      id: 0,
      name: "AnkurTest2"
    }
  ],
  status: "AnkurTest4"
}
When method post
Then status 200
* match each response == [{ id: '#number', category: {id: '#number', name: '#string'}, name: '#string', photoUrls: '#array', tags: '#array', status: '#string'}]



Scenario: verify post api response and schema for  /v2/pet/{petID}
    
    And path 'pet/'
    * form field petId = 7
* form field name = 'AnkurJindal'
* form field status = 'available'
    When method post
    Then status 200
    And def response = karate.lowerCase(response)
    And match response[0] contains 'AnkurJindal'




Scenario: upload image
    Given path 'pet/17/uploadImage', 'binary'
    And param name = 'test.jpg'
    And request read('test.jpg')
    When method post
    Then status 200
    And match response contains { code: '#number' }
