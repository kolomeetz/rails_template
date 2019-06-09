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
  gem 'factory_bot_rails'
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

makefile = <<-EOF
.PHONY: dev test

dev:
	overmind start

test:
	bundle exec rspec

test-watch:
	bundle exec guard
EOF

create_file 'Makefile', makefile

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
