Feature: Easements relax rules of the National Routeing Guide

  Scenario: Double back easement at Derby between Spondon and Long Eaton
    Given a journey:
      | SPO | depart   | train     |
      | DBY | change   | train     |
      | SPO | passing  | train     |
      | LGE | arrive   | train     |
    And a "positive" "doubleback" easement with locations:
      | DBY | 4 |
      | LGE | 3 |
      | SPO | 1 |
      | SPO | 2 |
    And the shortest distance between "SPO" and "LGE" is "5.44" miles
    And the following distances:
      | SPO | DBY | 2.53  |
      | DBY | SPO | 2.53  |
      | SPO | LGE | 5.44  |
      | LGE | SPO | 5.44  |
    And the group "G09" contains "DBY,LGE,SPO"
    Then the journey should be "valid" because "journey goes via a valid routeing point"

  Scenario: Double back easement at Derby between Spondon and Long Eaton is not valid as far as East Midlands Parkway
    Given a journey:
      | SPO | depart   | train     |
      | DBY | change   | train     |
      | SPO | passing  | train     |
      | LGE | calling  | train     |
      | EMD | arrive   | train     |
    And a "positive" "doubleback" easement with locations:
      | DBY | 4 |
      | LGE | 3 |
      | SPO | 1 |
      | SPO | 2 |
    And the shortest distance between "SPO" and "LGE" is "5.44" miles
    And the following distances:
      | SPO | DBY | 2.53  |
      | DBY | SPO | 2.53  |
      | SPO | LGE | 5.44  |
      | LGE | SPO | 5.44  |
      | LGE | EMD | 3.85  |
    And the group "G09" contains "DBY,LGE,SPO"
    And "EMD" has the routeing points "G09"
    Then the journey should be "invalid" because "journey doubles back"
    
  Scenario: Local easement permitting journeys from Frodsham to Hooton via Chester
    Given a journey:
      | FRD | depart   | train     |
      | HSB | calling  | train     |
      | CTR | change   | train     |
      | BAC | calling  | train     |
      | CPU | calling  | train     |
      | HOO | arrive   | train     |
    And a "positive" "local" easement with locations:
      | CTR | 1 |
      | CTR | 4 |
      | SHT | 5 |
    And the shortest distance between "FRD" and "HOO" is "11.66" miles
    And the following distances:
      | FRD | HSB | 2.53  |
      | HSB | CTR | 7.43  |
      | CTR | BAC | 1.44  |
      | BAC | CPU | 3.73  |
      | CPU | HOO | 3.16  |
    And the group "G09" contains "DBY,LGE,SPO"
    And "FRD" has the routeing points "CTR,HOO"
    And "HOO" has the routeing points "HOO"
    Then the journey should be "valid" because "journey goes via a valid routeing point"

