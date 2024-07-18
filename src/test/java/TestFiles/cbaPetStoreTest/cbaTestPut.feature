
  Feature: petstore swagger regression test  for post api

  Background:
    * url 'https://petstore.swagger.io/v2/'

Scenario : verify put api by posting first and updating using put

Given path 'pet'
And request {
id: 18,
  category: {
    id: 18,
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


Given path 'pet'
And request {
id: 18,
  category: {
    id: 18,
    name: "Jindal"
  },
  name: "Jindal",
  photoUrls: [
    "AnkurTest"
  ],
  tags: [
    {
      id: 0,
      name: "Jindal"
    }
  ],
  status: "Jindal"
}
When method post
Then status 200
    And match response[0] contains 'Jindal'
