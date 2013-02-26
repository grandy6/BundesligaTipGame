source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

#Login-Gem
gem 'devise'

#Adminkrams
gem 'activeadmin'

#Webservice
gem 'savon', '~> 1.0'

# avalible actions:
# -------------------
# :get_avail_leagues
# :get_next_match
# :get_last_match
# :get_next_match_by_league_team
# :get_last_match_by_league_team
# :get_current_group_order_id
# :get_current_group
# :get_matchdata_by_group_league_saison
# :get_matchdata_by_league_date_time
# :get_matchdata_by_teams
# :get_matchdata_by_league_saison
# :get_matchdata_by_group_league_saison_json
# :get_fusballdaten
# :get_match_by_match_id
# :get_teams_by_league_saison
# :get_avail_groups
# :get_avail_sports
# :get_avail_leagues_by_sports
# :get_goals_by_match
# :get_goals_by_league_saison
# :get_goal_getters_by_league_saison
# :get_last_change_date_by_league_saison
# :get_last_change_date_by_group_league_saison

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

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# To use debugger
# gem 'debugger'

#Paperclip (Avatare etc.)
#gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
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
