# HashSerializer

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_serializers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_serializers

## Usage

```ruby
class UserSerializer < HashSerializer::JSON
  format :boolean do |val|
    !!val
  end
  format :date do |val|
    val.iso8601
  end
  
  reveal :first_name, :email
  reveal :last_name, as: :surname
  
  reveal :is_admin, format: :boolean
  
  with_format :date do
    reveal :registered_at
  end
end

serializable_user = UserSerializer.new(
  first_name: 'Bob',
  last_name: 'Marley',
  email: 'email@exmple.com',
  is_admin: nil,
  registered_at: Time.now
)

serializable_user.as_json # {:first_name=>"Bob", :email=>"email@exmple.com", :surname=>"Marley", :is_admin=>false, :registered_at => "2019-03-05T23:18:33+02:00"}

serializable_user.to_json # '{"first_name":"Bob","email":"email@exmple.com","surname":"Marley","is_admin":false,"registered_at":"2019-03-05T23:18:33+02:00"}'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shved270189/hash_serializers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

