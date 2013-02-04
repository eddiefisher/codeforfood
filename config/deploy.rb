set :application, 'codeforfood'
set :repository, 'git://github.com/pyromaniac/codeforfood.git'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :server_name, 'codeforfood.ru'
set :use_sudo, false
set :user, 'pyromaniac'
set(:deploy_to) { "/home/#{user}/#{application}" }
set :rvm_ruby_string, '1.9.3'

default_run_options[:pty] = true

role :web, server_name                          # Your HTTP server, Apache/etc
role :app, server_name                          # This may be the same as your `Web` server
role :db, server_name, :primary => true # This is where Rails migrations will run

namespace :customs do
  task :config do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
  task :symlink do
    run "ln -nfs #{shared_path}/sockets #{latest_release}/tmp/sockets"
  end
end

before 'deploy:assets:precompile', 'customs:config'
after 'deploy:symlink', 'customs:symlink'
# after 'deploy:restart', 'unicorn:reload'
after 'deploy:restart', 'unicorn:restart'
# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:restart', 'deploy:cleanup'

require 'capistrano-unicorn'
require 'rvm/capistrano'
require 'bundler/capistrano'
