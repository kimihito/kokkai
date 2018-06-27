# Kokkai

[![Build Status](https://travis-ci.org/kimihito/kokkai.svg?branch=master)](https://travis-ci.org/kimihito/kokkai)

http://kokkai.ndl.go.jp/api.html client library, written in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kokkai'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kokkai

## Usage

```
# Initialization
client = Kokkai::Client.new

# Call speech data
client.speech(any: "アベノミクス", speaker: "安倍晋三", start_record: 1, maximum_records: 5).body.data


# call meeting API

client.meeting(name_of_house: "両院", name_of_meeting: "国家基本政策委員会合同審査会").body.data


```

More information about parameters and attributes is [here](http://kokkai.ndl.go.jp/api.html#specification) (Japanese).


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kimihito/kokkai.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
