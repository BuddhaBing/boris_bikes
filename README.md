# Boris Bikes

[![Build Status](https://travis-ci.org/treborb/boris_bikes.svg?branch=master)](https://travis-ci.org/treborb/boris_bikes)
[![codecov](https://codecov.io/gh/treborb/boris_bikes/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/boris_bikes)

## [Makers Academy](http://www.makersacademy.com) - Week 1 - Paired Programming Challenge

## Technologies
* [Ruby v2.3.3](https://www.ruby-lang.org/en/)
* [Rspec](http://rspec.info/)

## Jump To
* [User Stories](#user-stories)
* [Installation](#install)
* [Usage](#usage)
* [Tests](#tests)

## The Brief

Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer (that was easy). Transport for London, the body responsible for delivery of a new bike system, came to us with a plan: a network of docking stations and bikes that anyone can use. This program emulates all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## <a name="user-stories">User Stories</a>

```
As a member of the public,
So that I can get across town,
I'd like to get a working bike from a docking station.

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a member of the public,
So that I am not charged for longer than necessary,
I'd like to return a bike to a docking station.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```

## <a name="install">Installation</a>
```
$ git clone https://github.com/treborb/boris_bikes.git
$ cd boris_bikes
$ rvm use 2.3.3 --install --binary --fuzzy
$ gem install bundler
$ bundle
```

## <a name="usage">Usage</a>

#### Load up your favourite REPL (e.g. irb)

```
$ irb
```

#### In the REPL
```ruby
$ require "./lib/docking_station"
$ bike = Bike.new
$ station = DockingStation.new
$ station.dock_bike(bike)
$ station.release_bike(bike)
```

***Or to report a bike as broken when returning it***
```ruby
$ require "./lib/docking_station"
$ bike = Bike.new
$ station = DockingStation.new
$ station.dock_bike(bike, false)
$ station.release_bike(bike)
```

## <a name="tests">Running the tests</a>
```
$ rspec
```
