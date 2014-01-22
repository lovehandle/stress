Stress
======

## About

Stress is a performance measurement library for quick calculations as to response time and success rates or concurrent requests.

## Installation

```
git clone git://github.com:rclosner/stress.git
cd stress
bundle install
```

## Usage

```
./bin/stress
```

Options:
  * --endpoint, -e <s>:   Remote endpoint to test
  * --concurrency, -c <i>:   Number of simultaneous connections (default: 10)
  * --iterations, -i <i>:   Number of times to run the test (default: 1)
  * --verbose, -v:   Whether or not to print the results of the test
  * --help, -h:   Show this message
