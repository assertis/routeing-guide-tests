Feature: A direct service is always valid

  # A direct service from CHX to HIB, stopping at WAE and then running fast to HIB
  Scenario: 
    Given a journey:
      | CHX | depart   | train     |
      | WAE | stopping | train     |
      | LBG | passing  | train     |
      | ORP | passing  | train     |
      | SEV | passing  | train     |
      | TON | passing  | train     |
      | HIB | arrive   | train     |
    Then the journey should be "valid"
