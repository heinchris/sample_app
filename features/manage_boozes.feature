Feature: Manage boozes
  In order to know what types of booze I like
  Olivia and I
  want to track boozes that I've really liked.
  
  Scenario: Go to the booze page from the home page
    Given I am on the home page
    When I follow "Add some booze!"
    Then I should see "Boozes"

  Scenario: Add a new booze from the index boozes page
    Given I am on the list boozes page
    When I fill in "Name" with "Pinot Grigio"
      And I fill in "Rating" with "5"
      And I press "Create Booze"
    Then I should see the following boozes:
    |Name|Rating|
    |Pinot Grigio|5|
  Scenario: Add an incorrect booze on the booze index page
    Given I am on the list boozes page
    When I fill in "Name" with ""
      And I fill in "Rating" with "5"
      And I press "Create Booze"
    Then I should see "Boozes"
      And I should see "error"

  Scenario: A user should be able to log in with the sign in link
    Given I am not authenticated
      And I am on the home page
    Then I should see "Sign in"

  Scenario: A logged in user should not see the sign in link
    Given I am a new, authenticated user
      And I am on the home page
    Then I should not see "Sign in"

  Scenario: As a logged in user I should be able to rate booze
    Given I am a new, authenticated user
      And the following boozes:
        |name|rating|
        |Pinot Grigio|5|
      And I am on the list boozes page
    When I follow "Add to My Boozes"
      And I fill in "1" for "User rating"
      And I press "Update My Rating"
    Then I should see the following boozes:
    |Name|Rating|Your Rating|
            |Pinot Grigio|5|1|
    When I follow "Change My Rating"
      And I fill in "2" for "User rating"
      And I press "Update My Rating"
    Then I should see the following boozes:
    |Name|Rating|Your Rating|
            |Pinot Grigio|5|2|
    
    

    
