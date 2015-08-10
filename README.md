# NetworkTester

Announces the number of milliseconds it takes for a ping response. Can pass the millisecond threshold before announcement.

When diagnosing network issues, you may want to plug and unplug ethernet cables to search for a problem. The genesis of this project is I wanted a way to do this without carrying my laptop around and looking at it all the time.

On a Mac, the number of milliseconds taken by the ping is announced. On Linux, I believe there is an audible beep when the ping takes longer than the threshold. (Untested.)

## Installation

Install it to get the bin file:

    $ gem install network_tester

Or add this line to your application's Gemfile:

```ruby
gem 'network_tester'
```

And then execute:

    $ bundle

## Usage

After installing the gem, you may need to open a new shell, and then type:

    network_tester <millisecond_threshold>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/network_tester.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

