
Feature: Validate journeys against the national routeing guide

  # TODO check if New Cross is an interchange or routeing point, probably is
  Scenario: A direct service is always valid
    Given a journey:
      | CHX | alight   | train     |
      | WAE | stopping | train     |
      | LBG | passing  | train     |
      | ORP | passing  | train     |
      | SEV | passing  | train     |
      | TON | passing  | train     |
      | HIB | egress   | train     |
    Then the following routes should be:
      | ***** | valid   |

  Scenario: The geographically shortest route is always valid
    Given a journey:
      | SEV | alight   | train     |
      | TON | change   | train     |
      | HIB | stopping | train     |
      | TBW | egress   | train     |
    Then the following routes should be:
      | ***** | valid   |

  Scenario: Any journey within the specified margin of the shortest route is valid

  Scenario: Distances of non-rail (including timetabled-bus) legs are not included in the distance calculations

  # TODO a better demonstration would be a route that would fail if the last stops were train
  Scenario: Fixed legs at the beginning and end should be ignored
    Given a journey:
      | CST | n/a      | bus       |
      | LBG | stopping | train     |
      | WAE | stopping | train     |
      | BLK | n/a      | walk      |
    Then the following routes should be:
      | ***** | valid   |

