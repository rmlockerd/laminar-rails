# Laminar on Rails
[![Build Status](https://travis-ci.org/rmlockerd/laminar-rails.svg?branch=master)](https://travis-ci.org/rmlockerd/laminar-rails)
[![Maintainability](https://api.codeclimate.com/v1/badges/a99a88d28ad37a79dbf6/maintainability)](https://codeclimate.com/github/codeclimate/codeclimate/maintainability)

Adds Rails support to the Laminar workflow gem. Laminar Rails supports Ruby MRI versions 2.3+ and rails 4.2 - 5.2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'laminar-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install laminar-rails

## Usage

Laminar-Rails adds a couple of generators to facilitate the creation of
new Laminar particles and flows.

```
$ rails generate laminar:particle foo
```

The generator adds a file ``app/flows/foo.rb``:

```ruby
class Foo
  include Laminar::Particle

  def call
    # TODO
  end
end
```

The generator also adds a matching ``spec/flows/foo_spec.rb``.

There is also a flow generator:

```
$ rails generate laminar:flow foo
```

that creates a flow template:

```ruby
class Foo
  include Laminar::Flow

  # flow do
    # step :step1
    # step :step2
  # end
end
```

You can specify particle names on the generator command line.
```
$ rails generate laminar:flow foo something something_else
```

will create a new flow pre-populated with steps:

```ruby
class Foo
  include Laminar::Flow

  flow do
    step :something
    step :something_else
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/laminar-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Laminar::Rails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/laminar-rails/blob/master/CODE_OF_CONDUCT.md).
