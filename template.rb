def read_file(file_name)
  File.read("templates/#{file_name}")
end

def create_file_from_template(filename)
  file = read_file(filename)
  create_file(filename, file)
end

# Add gems
gem 'lograge'

gem_group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-performance'
end

gem_group :development, :test do
  gem 'faker'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'simplecov'
  gem 'factory_bot_rails'
end

environment nil, env: 'development' do
  read_file 'environment/development.rb'
end

run 'rm README.md'

%w(
  Makefile
  .rubocop.yml
  .circleci/config.yml
).each(&method(:create_file_from_template))

after_bundle do
  git :init
  git commit: "-a -m 'Initial commit'"

  run 'bundle exec guard init'
  git commit: "-a -m 'Initialize guard'"

  generate 'rspec:install'
  git commit: "-a -m 'Initialize rspec'"

  generate 'annotate:install'
  git commit: "-a -m 'Initialize annotate gem'"
end
