# HashSerializer

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_serializer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_serializer

## Usage

```ruby
class UserSerializer < HashSerializer::JSON
  reveal :first_name, :email
  reveal :last_name, as: :surname
end

serializable_user = UserSerializer.new(
  first_name: 'Bob',
  last_name: 'Marley',
  email: 'email@exmple.com'
)

serializable_user.as_json # {:first_name=>"Bob", :email=>"email@exmple.com", :surname=>"Marley"}

serializable_user.to_json # '{"first_name":"Bob","email":"email@exmple.com","surname":"Marley"}'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shved270189/hash_serializers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

