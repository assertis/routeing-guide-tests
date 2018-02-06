Feature: Validate journeys against the national routeing guide

  @inprogress
  Scenario: The origin and destination share a common routeing point so only Local Journey Rules apply

  @inprogress
  Scenario: A local journey on a through train is always valid

  # If there are A->C services that are shorter a journey from A->B->C is still valid if B is a common routeing point of A and C
  # as long as there are no other common routeing points that would result in a shorter journey
  @inprogress
  Scenario: A local journey is valid via the best common routeing point

  @inprogress
  Scenario: A local journey is not valid via a common routeing point if there is a common routeing point that results in a shorter journey

  @inprogress
  Scenario: A local journey is valid if it is the shortest route or within the margin of the shortest route

  @inprogress
  Scenario: A local journey is valid if it is the shortest route except deviations which are in the same station group as a station on the shortest route

  # Eastbourne doubleback?
  @inprogress
  Scenario: A local journey is valid if is the shortest route except for one valid doubleback at the origin or destination

  # TODO need more negative cases

  
