Feature: Ensure map journeys follow a valid sequence of maps

  Scenario: Rugby to Nuneaton via Coventry
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

  Scenario: Derby to London via Doncaster has no mapped journey
    Given a journey:
      | DBY | depart   | train     |
      | CHD | passing  | train     |
      | SHF | passing  | train     |
      | DON | change   | train     |
      | RET | passing  | train     |
      | NNG | passing  | train     |
      | GRA | passing  | train     |
      | PBO | passing  | train     |
      | HUN | passing  | train     |
      | SDY | passing  | train     |
      | HIT | passing  | train     |
      | SVG | passing  | train     |
      | WGC | passing  | train     |
      | PBR | passing  | train     |
      | AAP | passing  | train     |
      | FPK | passing  | train     |
      | KGX | arrive   | train     |
    And the shortest distance between "RUG" and "NUN" is "128.67" miles
    And the following distances:
      | DBY | CHD | 24.15 |
      | CHD | SHF | 12.25 |
      | SHF | DON | 18.43 |
      | DON | RET | 17.35 |
      | RET | NNG | 18.51 |
      | NNG | GRA | 14.63 |
      | GRA | PBO | 29.08 |
      | PBO | HUN | 17.49 |
      | HUN | SDY | 14.75 |
      | SDY | HIT | 12.20 |
      | HIT | SVG |  4.34 |
      | SVG | WGC |  7.28 |
      | WGC | PBR |  7.60 |
      | PBR | AAP |  7.75 |
      | AAP | FPK |  2.47 |
      | FPK | KGX |  2.51 |
    And there is a "SOS" from "DBY" to "KGX" on route "00000" for "3050"
    And the group "G09" contains "BLP,DBY,DFI,LGE,SPO"
    And the group "G43" contains "ATB,BEE,NOT"
    And "G09" to "G01" has a permitted route "NM" with:
      | NM | G09 | G43 |
      | NM | G09 | LBO |
    And "G09" to "G01" has a permitted route "TV" with:
      | TV | G09 | G43 |
      | TV | G09 | TAM |
    Then the journey should be "invalid" because "journey does not follow a permitted route"

  @wip
  Scenario: Legs on a Thameslink service must follow the LO map
