# Rails application template

Create Rails app prepared for confortable coding in a second.

This configuration is full of opinions.

It doesn't define what database to use, that's the responsibility of your `~/.railsrc` file.

## Usage

Run `rails new` command with `-m` option and point to location of the template file, like this:

    rails new project_name -m https://raw.githubusercontent.com/kolomeetz/rails_template/master/template.rb

## Added gems

Development and testing gems added:

- [annotate](https://github.com/ctran/annotate_models) to add model annotations as comments in the beginning of model files
- [bullet](https://github.com/flyerhzm/bullet) for detecting N+1 queries errors
- [factory_bot](https://github.com/thoughtbot/factory_bot) to create objects for testing
- [faker](https://github.com/stympy/faker) to generate fake data in tests
- [guard](https://github.com/guard/guard) to run tests automatically
- [rspec](http://rspec.info/) for writing unit tests
- [rubocop](https://github.com/rubocop-hq/rubocop) to check code style
- [simplecov](https://github.com/colszowka/simplecov) to check code coverage

Gems for production:
- [lograge](https://github.com/roidrage/lograge) to make requests logging nice and tidy

## Differences from Rails defaults

In development:
- `config.active_record.verbose_query_logs` is set to `false` to hide noisy logs 

## Plans

- [ ] add Circle CI configuration
- [ ] add Dockerfile with production-like configuration
- [ ] add docker-compose for development
