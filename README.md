# National Routeing Guide Tests

This repository contains a number of tests written in the [Gherkin](https://cucumber.io/docs/reference) syntax that can be used to check whether the [National Routeing Guide](http://data.atoc.org/routeing-guide) has been correctly applied to a journey.

Each test should contain enough information to bootstrap the data without using the official feed but please note due to topological and data changes the validity of the tests may vary when using real data.

## Language

All tests describe a journey in the format:

```gherkin
    Given a journey:
      | SDB | depart   | train     |
      | CRE | change   | train     |
      | SDB | passing  | train     |
      | WML | calling  | train     |
      | MAN | arrive   | train     |
```

The first column is the CRS code of the stop, the middle column the action at that station and the third column is the mode of transport.

The possible actions are: depart, change, passing, calling and arrive.

The possible modes of transport are: "train", "bus", "replacement bus", "walk", "tube", "tram", "ferry", "metro" and "transfer".

## Hypothetical scenarios

Some scenarios are theoretically possible but there is no known example. In this case dummy data will be used to highlight the scenario and the scenario will be tagged with `@hypothetial` so that it can be omitted when running against real data. 

## Contributing

Contributions are welcome in the form of PRs or issues. For discussion please see the [Open Rail Data Talk forum](https://groups.google.com/forum/#!forum/openraildata-talk).

## License

Licensed under [GNU GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html).
