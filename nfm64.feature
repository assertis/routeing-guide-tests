Feature: The fare from origin to destination must not be cheaper than the fare from ORP to destination or origin to DRP

  # Stonegate to Dover Priory via Hastings and Ashford
  Scenario: Journey is not within 3 miles of the shortest distance and has an appropriate fare
    Given a journey:
      | SOG | depart   | train     |
      | SLQ | stopping | train     |
      | HGS | change   | train     |
      | AFK | change   | train     |
      | DVP | arrive   | train     |
    And the shortest distance between "SOG" and "DVP" is "62.15" miles
    And the following distances:
      | SOG | SLQ | 17.88 |
      | SLQ | HGS | 0.73  |
      | HGS | AFK | 26.34 |
      | AFK | DVP | 21.22 |
    And there is a "CDS" from "SOG" to "DVP" on route "00000" for "1130"
    And there is a "CDS" from "SLQ" to "DVP" on route "00000" for "990"
    And "SOG" has the routeing points "TON,G15"
    And "DVP" has the routeing points "DVP"
    And the group "G15" contains "SLQ,HGS"
    Then the journey should be "valid" on "00000"

  # Winchester to Brighton via Basingstoke and Clapham Junction
  Scenario: Journey is not within 3 miles of the shortest distance and has a fare for 00700 but not for 00000
    Given a journey:
      | WIN | depart   | train     |
      | BSK | change   | train     |
      | CLJ | change   | train     |
      | BTN | arrive   | train     |
    And the shortest distance between "WIN" and "BTN" is "65.29" miles
    And the following distances:
      | WIN | BSK | 18.82 |
      | BSK | CLJ | 43.91 |
      | CLJ | BTN | 48.10 |
    And there is a "CDS" from "WIN" to "BTN" on route "00000" for "2550"
    And there is a "CDS" from "BSK" to "BTN" on route "00000" for "2130"
    And there is a "CDS" from "WIN" to "BTN" on route "00700" for "1460"
    And there is a "CDS" from "BSK" to "BTN" on route "00700" for "1680"
    And "WIN" has the routeing points "BSK,ESL"
    And "BTN" has the routeing points "BTN"
    Then the journey should be "valid" on "00700"
