Feature: Ensure London Terminals is correctly calculated

  Scenario: Old Street is a valid London Terminal for journeys coming from Richmond
    Given a journey:
      | RMD | depart   | train |
      | KWG | calling  | train |
      | GUN | calling  | train |
      | SAT | calling  | train |
      | ACC | calling  | train |
      | WIJ | calling  | train |
      | KNR | calling  | train |
      | BSP | calling  | train |
      | BSY | calling  | train |
      | WHD | calling  | train |
      | FNY | calling  | train |
      | HDH | calling  | train |
      | GPO | calling  | train |
      | KTW | calling  | train |
      | CMD | calling  | train |
      | CIR | calling  | train |
      | HHY | change   | train |
      | EXR | calling  | train |
      | OLD | arrive   | train |
    And the shortest distance between "RMD" and "OLD" is "14.52" miles
    And the following distances:
      | RMD | KWG | 1.34 |
      | KWG | GUN | 1.06 |
      | GUN | SAT | 0.70 |
      | SAT | ACC | 0.69 |
      | ACC | WIJ | 1.88 |
      | WIJ | KNR | 0.98 |
      | KNR | BSP | 0.60 |
      | BSP | BSY | 0.46 |
      | BSY | WHD | 0.50 |
      | WHD | FNY | 0.41 |
      | FNY | HDH | 0.88 |
      | HDH | GPO | 0.60 |
      | GPO | KTW | 0.64 |
      | KTW | CMD | 0.54 |
      | CMD | CIR | 1.11 |
      | CIR | HHY | 0.45 |
      | HHY | EXR | 0.49 |
      | EXR | OLD | 1.19 |
    Then the journey should be "valid" because "journey is within three miles of the shortest distance"

  Scenario: Liverpool Street is not a valid London Terminal for journeys coming from Richmond
    Given a journey:
      | RMD | depart  | train |
      | KWG | calling | train |
      | GUN | calling | train |
      | SAT | calling | train |
      | ACC | calling | train |
      | WIJ | calling | train |
      | KNR | calling | train |
      | BSP | calling | train |
      | BSY | calling | train |
      | WHD | calling | train |
      | FNY | calling | train |
      | HDH | calling | train |
      | GPO | calling | train |
      | KTW | calling | train |
      | CMD | calling | train |
      | CIR | calling | train |
      | HHY | calling | train |
      | CNN | calling | train |
      | DLK | calling | train |
      | HKC | calling | train |
      | HMN | calling | train |
      | HKW | calling | train |
      | SRA | change  | train |
      | LST | arrive  | train |
    And the shortest distance between "RMD" and "LST" is "14.52" miles
    And the following distances:
      | RMD | KWG | 1.34 |
      | KWG | GUN | 1.06 |
      | GUN | SAT | 0.70 |
      | SAT | ACC | 0.69 |
      | ACC | WIJ | 1.88 |
      | WIJ | KNR | 0.98 |
      | KNR | BSP | 0.60 |
      | BSP | BSY | 0.46 |
      | BSY | WHD | 0.50 |
      | WHD | FNY | 0.41 |
      | FNY | HDH | 0.88 |
      | HDH | GPO | 0.60 |
      | GPO | KTW | 0.64 |
      | KTW | CMD | 0.54 |
      | CMD | CIR | 1.11 |
      | CIR | HHY | 0.45 |
      | HHY | CNN | 0.55 |
      | CNN | DLK | 0.74 |
      | DLK | HKC | 0.75 |
      | HKC | HMN | 0.66 |
      | HMN | HKW | 0.85 |
      | HKW | SRA | 0.95 |
      | SRA | LST | 4.04 |
    And there is a "SDS" from "RMD" to "LST" on route "00000" for "250"
    And "RUG" to "NUN" has a permitted route "OV" with:
      | OV | BHO | GPO |
      | OV | BHO | WNP |
      | OV | BKG | WNP |
      | OV | CLJ | KPA |
      | OV | CMD | GPO |
      | OV | CMD | HHY |
      | OV | G01 | WIJ |
      | OV | G74 | HKW |
      | OV | GPO | BHO |
      | OV | GPO | CMD |
      | OV | GPO | WIJ |
      | OV | GUN | KWG |
      | OV | GUN | RMD |
      | OV | GUN | WIJ |
      | OV | HHY | CMD |
      | OV | HHY | HKW |
      | OV | HKW | G74 |
      | OV | HKW | HHY |
      | OV | KPA | CLJ |
      | OV | KPA | WIJ |
      | OV | KWG | GUN |
      | OV | KWG | RMD |
      | OV | KWG | WIJ |
      | OV | RMD | GUN |
      | OV | RMD | KWG |
      | OV | WFJ | WIJ |
      | OV | WIJ | G01 |
      | OV | WIJ | GPO |
      | OV | WIJ | GUN |
      | OV | WIJ | KPA |
      | OV | WIJ | KWG |
      | OV | WIJ | WFJ |
      | OV | WNP | BHO |
      | OV | WNP | BKG |
    Then the journey should be "invalid" because "journey does not follow a permitted route"
