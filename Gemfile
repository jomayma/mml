source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'twitter'
gem 'twitter-text'
gem 'googlebooks'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'

# use Haml for templates
gem 'haml'
# use Ruby debugger
group :development, :test do
#gem 'linecache19', '0.5.13'
#gem 'ruby-debug-base19', '0.11.26'
#gem 'ruby-debug19', :require => 'ruby-debug'
#  gem 'ruby-debug19'
  gem 'debugger'
  #gem 'ruby-debug'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rack_session_access'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
#gem 'execjs'
#gem 'therubyracer'
group :test, :development do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails', '~> 2.0'
  gem 'ZenTest'
  gem 'sqlite3' # use SQLite only in development and testing
  gem 'json', '~> 1.7.7'
end

group :production do
  gem 'pg' # use PostgreSQL in production (Heroku)
end

