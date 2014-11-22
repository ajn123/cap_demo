# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'capistrano-deploy'
set :repo_url, 'git@github.com:ajn123/cap_demo.git'
set :rvm_ruby_version, '2.0.0'
set :stage, :production
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git


# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
    end
  end



  after :publishing, :restart
  after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
  after 'deploy:restart', 'unicorn:restart'   # app preloaded
  after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
