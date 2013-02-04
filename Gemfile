source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'pg'

gem 'activeuuid', github: 'jashmenn/activeuuid'

gem 'puffer', github: 'puffer/puffer'
gem 'puffer_pages', github: 'puffer/puffer_pages', branch: 'uuid'

gem 'friendly_id'
gem 'bcrypt-ruby'
gem 'unicorn'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer'
  gem 'uglifier'
  gem 'zurb-foundation'
end

group :development, :test do
  gem 'fabrication'
  gem 'forgery'
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano-unicorn', github: 'sosedoff/capistrano-unicorn', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false
end