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
    And the shortest distance between "DBY" and "KGX" is "128.67" miles
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

  # Nuneaton to York via Peterborough not valid on 00000 but is valid on 00076
  Scenario: Some journeys are mapped via a specific location
    Given a journey:
      | NUN | depart  | train |
      | HNK | calling | train |
      | NBR | calling | train |
      | LEI | calling | train |
      | MMO | calling | train |
      | OKM | calling | train |
      | SMD | calling | train |
      | PBO | change  | train |
      | GRA | calling | train |
      | NNG | passing | train |
      | RET | passing | train |
      | DON | passing | train |
      | YRK | arrive  | train |
    And a "SDS" fare on route "00000"
    And route "00076" goes via "PBO"
    And the shortest distance between "NUN" and "YRK" is "119.68" miles
    And the following distances:
      | NUN | HNK |  3.78 |
      | HNK | NBR |  7.93 |
      | NBR | LEI |  6.73 |
      | LEI | MMO | 14.79 |
      | MMO | OKM | 11.36 |
      | OKM | SMD | 13.78 |
      | SMD | PBO | 12.09 |
      | PBO | GRA | 29.08 |
      | GRA | NNG | 14.63 |
      | NNG | RET | 18.51 |
      | RET | DON | 17.35 |
      | DON | YRK | 32.54 |
    And "NUN" has the routeing points "NUN"
    And "YRK" has the routeing points "YRK"
    And the group "G47" contains "NCT,NNG"
    And there is a "SDS" from "NUN" to "YRK" on route "00000" for "2720"
    And there is a "SDS" from "NUN" to "YRK" on route "00076" for "3150"
    And "NUN" to "YRK" has a permitted route "BP,BM,MN" with:
      | BP | NUN | LEI |
      | BP | LEI | MMO |
      | BP | MMO | OKM |
      | BP | OKM | PBO |
      | BM | NUN | TAM |
      | MN | HGT | YRK |
    And "NUN" to "PBO" has a permitted route "BP" with:
      | BP | NUN | LEI |
      | BP | LEI | MMO |
      | BP | MMO | OKM |
      | BP | OKM | PBO |
    And "PBO" to "YRK" has a permitted route "KY" with:
      | KY | PBO | GRA |
      | KY | GRA | G47 |
      | KY | G47 | RET |
      | KY | RET | DON |
      | KY | DON | YRK |
    Then the journey should be "invalid" because "journey does not follow a permitted route"


  # Nuneaton to York via Peterborough not valid on 00000 but is valid on 00076
  Scenario: Some journeys are mapped via a specific location
    Given a journey:
      | NUN | depart  | train |
      | HNK | calling | train |
      | NBR | calling | train |
      | LEI | calling | train |
      | MMO | calling | train |
      | OKM | calling | train |
      | SMD | calling | train |
      | PBO | change  | train |
      | GRA | calling | train |
      | NNG | passing | train |
      | RET | passing | train |
      | DON | passing | train |
      | YRK | arrive  | train |
    And a "SDS" fare on route "00076"
    And route "00076" goes via "PBO"
    And the shortest distance between "NUN" and "YRK" is "119.68" miles
    And the following distances:
      | NUN | HNK |  3.78 |
      | HNK | NBR |  7.93 |
      | NBR | LEI |  6.73 |
      | LEI | MMO | 14.79 |
      | MMO | OKM | 11.36 |
      | OKM | SMD | 13.78 |
      | SMD | PBO | 12.09 |
      | PBO | GRA | 29.08 |
      | GRA | NNG | 14.63 |
      | NNG | RET | 18.51 |
      | RET | DON | 17.35 |
      | DON | YRK | 32.54 |
    And "NUN" has the routeing points "NUN"
    And "YRK" has the routeing points "YRK"
    And the group "G47" contains "NCT,NNG"
    And there is a "SDS" from "NUN" to "YRK" on route "00000" for "2720"
    And there is a "SDS" from "NUN" to "YRK" on route "00076" for "3150"
    And "NUN" to "YRK" has a permitted route "BP,BM,MN" with:
      | BP | NUN | LEI |
      | BP | LEI | MMO |
      | BP | MMO | OKM |
      | BP | OKM | PBO |
      | BM | NUN | TAM |
      | MN | HGT | YRK |
    And "NUN" to "PBO" has a permitted route "BP" with:
      | BP | NUN | LEI |
      | BP | LEI | MMO |
      | BP | MMO | OKM |
      | BP | OKM | PBO |
    And "PBO" to "YRK" has a permitted route "KY" with:
      | KY | PBO | GRA |
      | KY | GRA | G47 |
      | KY | G47 | RET |
      | KY | RET | DON |
      | KY | DON | YRK |
    Then the journey should be "valid" because "journey passed long distance rules"

  # Norwich to Coventry via Rugby is nearly valid, but not
  Scenario: Journey's must follow every link in the maps
    Given a journey:
      | NRW | depart  | train |
      | ELY | calling | train |
      | PBO | change  | train |
      | OKM | calling | train |
      | MMO | calling | train |
      | LEI | calling | train |
      | NUN | calling | train |
      | RUG | change  | train |
      | COV | arrive  | train |
    And a "SDS" fare on route "00700"
    And the shortest distance between "NRW" and "COV" is "161.88" miles
    And the following distances:
      | ELY | NRW | 53.70 |
      | ELY | PBO | 30.48 |
      | OKM | PBO | 25.87 |
      | MMO | OKM | 11.36 |
      | LEI | MMO | 14.79 |
      | LEI | NUN | 18.44 |
      | NUN | RUG | 14.54 |
      | COV | RUG | 11.46 |
    And "NRW" has the routeing points "NRW"
    And "COV" has the routeing points "COV"
    And "NRW" to "COV" has a permitted route "AB,BI" with:
      | ELY | PBO | AB |
      | NRW | ELY | AB |
      | NUN | G02 | AB |
      | NUN | G59 | AB |
      | NUN | LEI | AB |
      | OKM | MMO | AB |
      | PBO | OKM | AB |
      | MMO | LEI | AB |
      | LEI | NUN | AB |
      | RUG | COV | BI |
    Then the journey should be "invalid" because "journey does not follow a permitted route"

  # TODO
  # Scenario: Fares routed via a location are validated to and from that location

  # Norwich to Stafford is valid via London on route 00452 as the fares have a cross London marker
  # Note that the portion from G01 to G65 does not follow the map and we've manually added G01 to WFJ in SF
  Scenario: Cross London fares are valid via London
    Given a journey:
      | NRW | depart  | train |
      | DIS | calling | train |
      | SMK | calling | train |
      | IPS | calling | train |
      | MNG | calling | train |
      | COL | calling | train |
      | MKT | calling | train |
      | WTM | calling | train |
      | SNF | calling | train |
      | RMF | calling | train |
      | SRA | calling | train |
      | LST | change  | train |
      | EUS | change  | tube  |
      | WIJ | calling | train |
      | WFJ | calling | train |
      | BLY | calling | train |
      | MKC | calling | train |
      | RUG | calling | train |
      | NUN | calling | train |
      | TAM | calling | train |
      | LTV | calling | train |
      | RGL | calling | train |
      | STA | arrive  | train |
    And a "SDS" fare on route "00452" with a xLondon marker
    And there is a "SOS" from "NRW" to "STA" on route "00000" for "3050"
    And the shortest distance between "NRW" and "STA" is "183.89" miles
    And the following distances:
      | NRW | SMK |  34.3600 |
      | SMK | IPS |  11.8800 |
      | IPS | MNG |   9.3000 |
      | MNG | COL |   7.7800 |
      | COL | MKT |   5.0400 |
      | MKT | WTM |   8.0500 |
      | WTM | SNF |  18.4100 |
      | SNF | RMF |   7.8200 |
      | RMF | SRA |   8.3300 |
      | SRA | LST |   4.0400 |
      | LST | EUS |  17.8900 |
      | EUS | WFJ |  17.4700 |
      | WFJ | BLY |  29.2300 |
      | BLY | MKC |   3.1500 |
      | MKC | RUG |  32.7700 |
      | RUG | NUN |  14.5400 |
      | NUN | TAM |  12.9000 |
      | TAM | LTV |   6.2500 |
      | LTV | RGL |   8.0100 |
      | RGL | STA |   5.0000 |
    And "NRW" has the routeing points "NRW"
    And "STA" has the routeing points "G65"
    And the group "G65" contains "STA"
    And the group "G37" contains "RMF"
    And the group "G74" contains "SRA"
    And the group "G01" contains "LST,EUS"
    And "NRW" to "G65" has a permitted route "AB,BV" with:
    # shortened but essentially not valid
      | AB | NRW | ELY |
      | BV | RUG | G65 |
    And "NRW" to "G01" has a permitted route "EA" with:
      | EA | NRW | DIS |
      | EA | DIS | SMK |
      | EA | SMK | IPS |
      | EA | IPS | MNG |
      | EA | MNG | COL |
      | EA | COL | MKT |
      | EA | MKT | WTM |
      | EA | WTM | SNF |
      | EA | SNF | G37 |
      | EA | G37 | G74 |
      | EA | G74 | G01 |
    And "G01" to "G65" has a permitted route "SF" with:
      | SF | G01 | WIJ |
      | SF | WIJ | WFJ |
      | SF | WFJ | BLY |
      | SF | BLY | MKC |
      | SF | MKC | RUG |
      | SF | RUG | NUN |
      | SF | NUN | TAM |
      | SF | TAM | LTV |
      | SF | LTV | RGL |
      | SF | RGL | G65 |
    Then the journey should be "valid" because "journey passed long distance rules"
