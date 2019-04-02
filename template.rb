# Add gems
gem 'lograge'

gem_group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rubocop'
end

gem_group :development, :test do
  gem 'faker'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'simplecov'
end

environment nil, env: 'development' do
<<-CODE
  config.after_initialize do
    Bullet.enable = true
    Bullet.rails_logger = true
  end

  config.active_record.verbose_query_logs = false

CODE
end

run 'rm README.md'

after_bundle do
  git :init
  run 'bundle exec guard init'
  run 'bundle exec rspec --init'
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
