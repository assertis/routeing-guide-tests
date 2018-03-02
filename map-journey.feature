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

  Scenario: The journey must have routeing points
    Given a journey:
      | WRM | depart  | train |
      | HOL | calling | train |
      | HAM | calling | train |
      | POO | calling | train |
      | PKS | calling | train |
      | BSM | calling | train |
      | BMH | calling | train |
      | SOU | change  | train |
      | SDN | calling | train |
      | SOA | calling | train |
      | ESL | calling | train |
      | SHW | calling | train |
      | WIN | calling | train |
      | BSK | calling | train |
      | FNB | calling | train |
      | WOK | calling | train |
      | SUR | calling | train |
      | NEM | calling | train |
      | WIM | calling | train |
      | CLJ | calling | train |
      | WAT | calling | train |
      | EUS | arrive  | train |
    And the shortest distance between "WRM" and "EUS" is "117.04" miles
    And the following distances:
      | WRM | HOL | 2.11  |
      | HOL | HAM | 2.8   |
      | HAM | POO | 2.19  |
      | POO | PKS | 1.83  |
      | PKS | BSM | 1.31  |
      | BSM | BMH | 2.61  |
      | BMH | SOU | 28.8  |
      | SOU | SDN | 1.99  |
      | SDN | SOA | 2.31  |
      | SOA | ESL | 1.39  |
      | ESL | SHW | 3.83  |
      | SHW | WIN | 3.14  |
      | WIN | BSK | 18.82 |
      | BSK | FNB | 14.59 |
      | FNB | WOK | 8.87  |
      | WOK | SUR | 12.31 |
      | SUR | NEM | 2.27  |
      | NEM | WIM | 2.55  |
      | WIM | CLJ | 3.32  |
      | CLJ | WAT | 5.35  |
      | WAT | EUS | 16.44 |
    And "WRM" has the routeing points "BCU,G33"
    And the group "G33" contains "DCH,DCW,UPW,WEY"
    Then the journey should be "invalid" because "failed nfm64"
