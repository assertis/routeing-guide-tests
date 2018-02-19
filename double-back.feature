Feature: Double backs are not permitted unless an easement applies

  Scenario: A double back from Sandbach to Manchester via Crewe is valid because mapped journey does not double back
    Given a journey:
      | SDB | depart   | train     |
      | CRE | change   | train     |
      | SDB | passing  | train     |
      | WML | passing  | train     |
      | MAN | arrive   | train     |
    And the shortest distance between "SDB" and "MAN" is "25.87" miles
    And the following distances:
      | SDB | CRE | 4.60  |
      | CRE | SDB | 4.60  |
      | SDB | WML | 14.27 |
      | WML | MAN | 11.60 |
    And there is a "SDS" from "SDB" to "MAN" on route "00000" for "660"
    And there is a "SDS" from "CRE" to "MAN" on route "00000" for "660"
    And "SDB" has the routeing points "CRE,G69"
    And "MAN" belongs to group "G20"
    And the group "G69" contains "WML"
    And "CRE" to "G20" has a permitted route "MS" with:
      | CRE | G69 |
      | G69 | G20 |
    Then the journey should be "valid" because "journey passed long distance rules"

