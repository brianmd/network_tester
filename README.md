# NetworkTester

Announces the number of milliseconds it takes for a ping response. When the ping exceeds a configurable threshold, it alerts you audibly (speech on Mac, terminal bell on Linux).

When diagnosing network issues, you may want to plug and unplug ethernet cables to search for a problem. The genesis of this project is I wanted a way to do this without carrying my laptop around and looking at it all the time.

On a Mac, the number of milliseconds taken by the ping is spoken aloud. On Linux, a terminal bell and text warning are printed when the ping exceeds the threshold.

## Installation

    $ gem install network_tester

Or add this line to your application's Gemfile:

```ruby
gem 'network_tester'
```

And then execute:

    $ bundle

## Usage

After installing the gem, you may need to open a new shell, and then type:

    network_tester [options]
    network_tester [maxtime] [address]

Positional arguments can be given in any order. Integers are treated as
the alert threshold; anything else as the host.

### Options

    -a, --address ADDRESS   Host to ping (default: google.com)
    -m, --maxtime MS        Alert threshold in ms (default: 70)
    -h, --help              Show help message
    -v, --version           Show version

### Examples

    network_tester                       # ping google.com, alert above 70ms
    network_tester 100                   # ping google.com, alert above 100ms
    network_tester yahoo.com             # ping yahoo.com, alert above 70ms
    network_tester 100 yahoo.com        # ping yahoo.com, alert above 100ms
    network_tester yahoo.com 100        # same as above
    network_tester -a 8.8.8.8 -m 100   # using named options

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brianmd/network_tester.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
