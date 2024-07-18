

  Feature: petstore swagger regression test  for post api

  Background:
    * url 'https://petstore.swagger.io/v2/'

Scenario : verify  delete functionality by first posting and later deleting same id


Given path 'pet/'
And request {
id: 17,
  category: {
    id: 17,
    name: "AnkurTest2"
  },
  name: "AnkurTest",
  photoUrls: [
    "AnkurTest2"
  ],
  tags: [
    {
      id: 0,
      name: "AnkurTest2"
    }
  ],
  status: "AnkurTest2"
}
When method post
Then status 200
* match each response == [{ id: '#number', category: {id: '#number', name: '#string'}, name: '#string', photoUrls: '#array', tags: '#array', status: '#string'}]
    And match response[0] contains 'AnkurTest2'

    Given path 'pet/', 17
When method delete
Then status 200


