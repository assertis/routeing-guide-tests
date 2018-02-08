Feature:
  A local journey via a common routeing point is valid if there are no other routeing points that result in a shorter
  journey and the journey is direct to and from the common routeing point.

  # Hypothetical
  Scenario: The shortest route is valid
    Given a journey:
      | AAA | depart   | train     |
      | BBB | change   | train     |
      | EEE | arrive   | train     |
    And the following distances:
      | AAA | BBB | 10 |
      | AAA | CCC | 20 |
      | AAA | DDD | 15 |
      | BBB | EEE | 1 |
      | CCC | EEE | 1 |
      | DDD | EEE | 1 |
    And "AAA" has the routeing points "G,DDD"
    And "EEE" has the routeing points "G,DDD"
    And the group "G" contains "BBB,CCC"
    Then the journey should be "valid" because "journey goes via a valid routeing point"

  # Hypothetical
  Scenario: The shortest route is valid
    Given a journey:
      | AAA | depart   | train     |
      | CCC | change   | train     |
      | EEE | arrive   | train     |
    And the following distances:
      | AAA | BBB | 10 |
      | AAA | CCC | 20 |
      | AAA | DDD | 15 |
      | BBB | EEE | 1 |
      | CCC | EEE | 1 |
      | DDD | EEE | 1 |
    And "AAA" has the routeing points "G,DDD"
    And "EEE" has the routeing points "G,DDD"
    And the group "G" contains "BBB,CCC"
    Then the journey should be "valid" because "journey goes via a valid routeing point"

  # Hypothetical
  Scenario: The shortest route is valid
    Given a journey:
      | AAA | depart   | train     |
      | DDD | change   | train     |
      | EEE | arrive   | train     |
    And the following distances:
      | AAA | BBB | 10 |
      | AAA | CCC | 20 |
      | AAA | DDD | 15 |
      | BBB | EEE | 1 |
      | CCC | EEE | 1 |
      | DDD | EEE | 1 |
    And "AAA" has the routeing points "G,DDD"
    And "EEE" has the routeing points "G,DDD"
    And the group "G" contains "BBB,CCC"
    Then the journey should be "invalid" because "not via the shortest routeing point"

