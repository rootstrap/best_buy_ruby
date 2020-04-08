# Best Buy Ruby

[![Build Status](https://travis-ci.com/rootstrap/best_buy_ruby.svg?token=7i1Qbv4PM7uB4Ljqux8D&branch=master)](https://travis-ci.com/rootstrap/best_buy_ruby)
[![Maintainability](https://api.codeclimate.com/v1/badges/d8dacb0f44a9379fee2d/maintainability)](https://codeclimate.com/github/rootstrap/best_buy_ruby/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d8dacb0f44a9379fee2d/test_coverage)](https://codeclimate.com/github/rootstrap/best_buy_ruby/test_coverage)

This is a Ruby gem for accessing all the different [Best Buy APIs](https://bestbuyapis.github.io/api-documentation).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'best_buy_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install best_buy_ruby

On a Ruby on Rails project, you can also use a generator to create the gem's initializer:

    $ rails generate best_buy:config
    
This will create this file: `config/initializers/best_buy.rb`

## Usage

The gem can be used to access Best Buy [APIs](general-overview.md):

- [Products](products-api.md)
- [Stores](stores-api.md)
- [Categories](categories-api.md)

Example:

```
products_api = BestBuy::Products.new(your_api_key)

products_api.get_by(min_price: 6.5, max_price: 11, item_condition: "New")
```

## Future Features

- [Commerce API](https://bestbuyapis.github.io/api-documentation/#commerce-api)
- [Buying Options API](https://bestbuyapis.github.io/api-documentation/#buying-options-open-box-api)
- [Recommendations API](https://bestbuyapis.github.io/api-documentation/#recommendations-api)
- [Sorting options](https://bestbuyapis.github.io/api-documentation/#sort)
- [Facets](https://bestbuyapis.github.io/api-documentation/#facets)
- Stores API

    - [Area function](https://bestbuyapis.github.io/api-documentation/#area-function)

(A detailed backlog can be found in our Github Projects [board](https://github.com/rootstrap/best_buy_ruby/projects/1))

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rootstrap/best_buy_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rootstrap/best_buy_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Best Buy Ruby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rootstrap/best_buy_ruby/blob/master/CODE_OF_CONDUCT.md).

## Credits

Rails Api Base is maintained by [Rootstrap](http://www.rootstrap.com) with the help of our
[contributors](https://github.com/rootstrap/best_buy_ruby/contributors).

[<img src="https://s3-us-west-1.amazonaws.com/rootstrap.com/img/rs.png" width="100"/>](http://www.rootstrap.com)
