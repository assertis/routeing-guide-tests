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
    And the group "G20" contains "MAN"
    And the group "G69" contains "WML"
    And "CRE" to "G20" has a permitted route "MS" with:
      | MS | CRE | G69 |
      | MS | G69 | G20 |
    Then the journey should be "valid" because "journey passed long distance rules"

  Scenario: A double back from Tonbridge to London Bridge via High Brooms is not valid
    Given a journey:
      | TON | depart   | train     |
      | HIB | change   | train     |
      | TON | passing  | train     |
      | SEV | passing  | train     |
      | ORP | passing  | train     |
      | PET | passing  | train     |
      | GRP | passing  | train     |
      | HGR | passing  | train     |
      | NWX | passing  | train     |
      | LBG | arrive   | train     |
    And the shortest distance between "SDB" and "MAN" is "27.70" miles
    And the following distances:
      | TON | HIB | 3.35  |
      | HIB | TON | 3.35  |
      | TON | SEV | 7.41  |
      | SEV | ORP | 8.32  |
      | ORP | PET | 1.14  |
      | PET | GRP | 3.71  |
      | GRP | HGR | 1.79  |
      | HGR | NWX | 2.34  |
      | NWX | LBG | 2.99  |
    And there is a "SDS" from "HIB" to "LBG" on route "00000" for "970"
    And there is a "SDS" from "TON" to "LBG" on route "00000" for "750"
    And "TON" has the routeing points "TON"
    And the group "G01" contains "WAE"
    And the group "G85" contains "ORP,PET"
    And "TON" to "G01" has a permitted route "HC,FV" with:
      | HC | TON | SEV |
      | HC | SEV | G85 |
      | HC | SEV | G85 |
      | FV | G85 | GRP |
      | FV | HGR | NWX |
      | FV | NWX | G01 |
    Then the journey should be "invalid" because "journey doubles back"
