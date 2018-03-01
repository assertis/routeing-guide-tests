Feature: Ensure map journeys follow a valid sequence of maps

  Scenario: The path of the map journey must follow a permitted sequence of maps and links within those maps
    Given a journey:
      | RUG | depart   | train     |
      | COV | change   | train     |
      | CAA | passing  | train     |
      | BEH | passing  | train     |
      | BEP | passing  | train     |
      | NUN | arrive   | train     |
    And the shortest distance between "RUG" and "NUN" is "14.54" miles
    And the following distances:
      | RUG | COV | 11.46 |
      | COV | CAA | 3.00  |
      | CAA | BEH | 2.64  |
      | BEH | BEP | 3.00  |
      | BEP | NUN | 1.51  |
    And there is a "SDS" from "RUG" to "NUN" on route "00000" for "380"
    And "RUG" to "NUN" has a permitted route "SM" with:
      | SM | RUG | COV |
      | SM | COV | NUN |
    Then the journey should be "valid" because "journey passed long distance rules"
