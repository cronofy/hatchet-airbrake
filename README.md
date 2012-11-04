# Hatchet Airbrake

An [Airbrake](http://airbrake.io) appender for [Hatchet](http://gshutler.github.com/hatchet/).

[![Build Status](https://secure.travis-ci.org/adambird/hatchet-airbrake.png?branch=master)](http://travis-ci.org/adambird/hatchet-airbake)

## Installation

Add this line to your application's Gemfile:

    gem 'hatchet-airbrake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hatchet-airbrake

## Usage

```ruby
Hatchet.configure do |config|
  config.appenders << Hatchet::AirbrakeAppender.new do |appender|
    appender.api_key   = 'YOUR_AIRBRAKE_PROJECT_API_KEY'
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request