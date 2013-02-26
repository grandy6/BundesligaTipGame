source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'mysql2'
# Login
gem 'devise'
# Admin
gem 'activeadmin'
# Webservice
gem 'savon', '~> 1.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'coffee-script-source', '~> 1.4.0' # ADD THIS LINE, 1.5.0 doesn't compile ActiveAdmin JavaScript files
  gem 'therubyracer', '0.10.2', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# Rollenmanagement und Autorisierung
gem 'cancan'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end
group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end
