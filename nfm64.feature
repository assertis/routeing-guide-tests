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
    And "G15" to "DVP" has a permitted route "KA" with:
      | KA | G15 | AFK |
      | MS | AFK | DVP |
    Then the journey should be "valid" on "00000"

  # Winchester to Brighton via Basingstoke and Clapham Junction
  Scenario: Journey is not within 3 miles of the shortest distance and has a fare for 00700 but not for 00000
    Given a journey:
      | WIN | depart   | train     |
      | BSK | change   | train     |
      | FNB | passing  | train     |
      | WOK | calling  | train     |
      | BFN | passing  | train     |
      | WYB | passing  | train     |
      | SUR | passing  | train     |
      | NEM | passing  | train     |
      | RAY | passing  | train     |
      | WIM | passing  | train     |
      | CLJ | change   | train     |
      | BAL | passing  | train     |
      | SRC | passing  | train     |
      | NRB | passing  | train     |
      | TTH | passing  | train     |
      | SRS | passing  | train     |
      | ECR | passing  | train     |
      | SCY | passing  | train     |
      | ELD | passing  | train     |
      | HOR | calling  | train     |
      | GTW | passing  | train     |
      | TBD | passing  | train     |
      | HHE | passing  | train     |
      | WVF | passing  | train     |
      | HSK | passing  | train     |
      | BTN | arrive   | train     |
    And the shortest distance between "WIN" and "BTN" is "65.29" miles
    And the following distances:
      | WIN | BSK | 18.82 |
      | BSK | FNB | 14.59 |
      | FNB | WOK | 8.87  |
      | WOK | BFN | 3.94  |
      | BFN | WYB | 1.25  |
      | WYB | SUR | 7.12  |
      | SUR | NEM | 2.27  |
      | NEM | RAY | 1.14  |
      | RAY | WIM | 1.41  |
      | WIM | CLJ | 3.32  |
      | CLJ | BAL | 1.95  |
      | BAL | SRC | 1.95  |
      | SRC | NRB | 0.86  |
      | NRB | TTH | 1.21  |
      | TTH | SRS | 0.73  |
      | SRS | ECR | 1.15  |
      | ECR | SCY | 0.90  |
      | SCY | ELD | 10.33 |
      | ELD | HOR | 4.11  |
      | HOR | GTW | 0.85  |
      | GTW | TBD | 2.69  |
      | TBD | HHE | 8.48  |
      | HHE | WVF | 11.39 |
      | WVF | HSK | 2.90  |
      | HSK | BTN | 7.08  |
    And there is a "CDS" from "WIN" to "BTN" on route "00000" for "2550"
    And there is a "CDS" from "BSK" to "BTN" on route "00000" for "2130"
    And there is a "CDS" from "WIN" to "BTN" on route "00700" for "1460"
    And there is a "CDS" from "BSK" to "BTN" on route "00700" for "1680"
    And "WIN" has the routeing points "BSK,ESL"
    And the group "G04" contains "BTN"
    And the group "G82" contains "BFN,WYB"
    And the group "G29" contains "NRB,SRC,SRH,SRS,STE,TTH"
    And the group "G08" contains "ECR,SCY,WCY"
    And the group "G60" contains "ELD,RDH"
    And "BSK" to "G04" has a permitted route "LE,LB" with:
      | LE | BSK | FNB |
      | LE | FNB | WOK |
      | LE | WOK | G82 |
      | LE | G82 | SUR |
      | LE | SUR | NEM |
      | LE | NEM | RAY |
      | LE | RAY | WIM |
      | LE | WIM | CLJ |
      | LB | CLJ | BAL |
      | LB | BAL | G29 |
      | LB | G29 | G08 |
      | LB | G08 | G60 |
      | LB | G60 | GTW |
      | LB | GTW | TBD |
      | LB | TBD | HHE |
      | LB | HHE | WVF |
      | LB | WVF | HSK |
      | LB | HSK | G04 |
    Then the journey should be "valid" on "00000"
