# pasep-pis-nit

[![Code Climate](https://codeclimate.com/github/shamanime/pasep-pis-nit/badges/gpa.svg)](https://codeclimate.com/github/shamanime/pasep-pis-nit)[![Test Coverage](https://codeclimate.com/github/shamanime/pasep-pis-nit/badges/coverage.svg)](https://codeclimate.com/github/shamanime/pasep-pis-nit)

Allows ActiveModel backed classes to validate PASEP/PIS/NIT fields.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pasep-pis-nit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pasep-pis-nit

## Usage

Add to your model:

```ruby
validates :my_pasep_pis_nit_attribute, :pasep_pis_nit => true
```

## Contributing

1. Fork it ( https://github.com/shamanime/pasep-pis-nit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
