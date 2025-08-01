# config valid for current version and patch releases of Capistrano
#lock "~> 3.15.0"

set :application, "company"
set :repo_url, "git@github.com:jedaeroweb/homepage.git"
set :branch, "main"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/company"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
#set :pty, true
set :rbenv_type, :user
set :rbenv_ruby, "3.3.4"
set :rbenv_prefix, "$HOME/.rbenv/bin/rbenv exec"
set :ssh_options, verify_host_key: :never
set :default_env, {'NODE_OPTIONS'=>'--openssl-legacy-provider'}
set :bundle_path, '/usr/local/bundle'

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key", ".env", ".ruby-version"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
#
namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'tmp:clear'
      end
    end
  end

  desc 'Refresh sitemap'
  task :refresh_sitemap do
    on roles(:app), in: :sequence, wait: 1 do
      within release_path do
        with rails_env: (fetch(:rails_env) || fetch(:stage)) do
          execute :rake, 'sitemap:refresh'
        end
      end
    end
  end

  after :finishing, 'deploy:refresh_sitemap'
  after :finishing, 'deploy:cleanup'
end

