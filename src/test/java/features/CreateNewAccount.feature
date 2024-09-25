Feature: Create new account
@CreateAccount
Scenario: Creating a new primary account
Given url BASE_URL
Given path "/api/accounts/add-primary-account"
      * def email = "elenikapugacheva1402@gmail.com"
Given request
"""
      {
      "email": "#(email)",
      "firstName": "Elena",
      "lastName": "Vin",
      "title": "Mrs.",
      "gender": "Female",
      "maritalStatus": "Married",
      "employmentStatus": "SDET",
      "dateOfBirth": "1991-02-14"
      }
"""
When method post
Then print response
Then status 201
Then assert response.email == email
      * def createdAccountId = response.id
      * def tokenGenerationResult = callonce read('GenerateSupervisorToken.feature')
      * def validToken = "Bearer " + tokenGenerationResult.response.token
      Given path "/api/accounts/delete-account"
      Given param primaryPersonId = createdAccountId
      Given header Authorization = validToken
      When method delete
      Then status 202