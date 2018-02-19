Feature: A journey within 3 miles of the shortest distance is valid

  # Tunbridge Wells to Paddock Wood via Tonbridge
  Scenario: The shortest route is valid
    Given a journey:
      | TBW | depart   | train     |
      | HIB | stopping | train     |
      | TON | change   | train     |
      | PDW | arrive   | train     |
    And the shortest distance between "TBW" and "PDW" is "10.17" miles
    And the following distances:
      | TBW | HIB | 1.53 |
      | HIB | TON | 3.35 |
      | TON | PDW | 5.29 |
    Then the journey should be "valid" because "journey is within three miles of the shortest distance"

  # Petts Wood to St Mary Cray, via Bromley instead of Chistlehurst
  Scenario: Any journey within the specified margin of the shortest route is valid
    Given a journey:
      | PET | depart   | train     |
      | BKL | stopping | train     |
      | BMS | change   | train     |
      | BKL | passing  | train     |
      | SMY | arrive   | train     |
    And the shortest distance between "PET" and "SMY" is "3.83" miles
    And the following distances:
      | PET | BKL | 1.80 |
      | BKL | BMS | 1.06 |
      | BMS | BKL | 1.06 |
      | BKL | SMY | 2.76 |
    Then the journey should be "valid" because "journey is within three miles of the shortest distance"

  # Ashford to Dover via Ramsgate
  Scenario: The journey more than 3 miles longer than the shortest is not valid
    Given a journey:
      | AFK | depart   | train     |
      | WYE | stopping | train     |
      | CIL | stopping | train     |
      | CRT | stopping | train     |
      | CBW | stopping | train     |
      | STU | stopping | train     |
      | MSR | stopping | train     |
      | RAM | change   | train     |
      | SDW | stopping | train     |
      | DEA | stopping | train     |
      | WAM | stopping | train     |
      | MTM | stopping | train     |
      | DVP | arrive   | train     |
    And the shortest distance between "AFK" and "DVP" is "21.22" miles
    And the following distances:
      | AFK | WYE | 4.28 |
      | WYE | CIL | 4.71 |
      | CIL | CRT | 2.08 |
      | CRT | CBW | 3.16 |
      | CBW | STU | 2.38 |
      | STU | MSR | 9.09 |
      | MSR | RAM | 4.04 |
      | RAM | SDW | 8.34 |
      | SDW | DEA | 4.13 |
      | DEA | WAM | 1.64 |
      | WAM | MTM | 2.73 |
      | MTM | DVP | 4.94 |
    And there is a "SOS" from "AFK" to "DVP" on route "00000" for "1000"
    Then the journey should be "invalid" because "journey does not follow a permitted route"

  # Ashford to Dover via a bus at Canterbury West
  Scenario: Distances of non-rail (including timetabled-bus) legs are not included in the distance calculations
    Given a journey:
      | AFK | depart   | train     |
      | WYE | stopping | train     |
      | CIL | stopping | train     |
      | CRT | stopping | train     |
      | CBW | change   | train     |
      | DVP | arrive   | bus       |
    And the shortest distance between "AFK" and "DVP" is "21.22" miles
    And the following distances:
      | AFK | WYE | 4.28 |
      | WYE | CIL | 4.71 |
      | CIL | CRT | 2.08 |
      | CRT | CBW | 3.16 |
      | CBW | DVP | 10.1 |
    Then the journey should be "valid" because "journey is within three miles of the shortest distance"

