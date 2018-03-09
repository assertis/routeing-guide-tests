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
      | SPO | LGE | 8.39  |
      | LGE | SPO | 8.39  |
    And there is a "SDS" from "SPO" to "LGE" on route "00000" for "150"
    And the group "G09" contains "DBY,LGE,SPO"
    Then the journey should be "valid" because "journey goes via a valid routeing point"

