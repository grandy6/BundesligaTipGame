require 'bundler/capistrano'
set :application, "BundesligaTipGame"
# set :branch, "master"
# set :scm, :git
# set :repository,  "git@github.com:mc388/BundesligaTipGame.git"
set :scm_passphrase, ""

set :deploy_via, :copy
set :scm, :none
set :repository, 'C:\Users\Tobias\we2\BundesligaTipGame'
set :use_sudo, false 

set :user, "we"

require 'capistrano/ext/multistage'

set :stages, ["staging", "production"]
set :default_stage, "staging"

ssh_options[:forward_agent] = true


# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

load 'deploy/assets'
