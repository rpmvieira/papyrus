# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "papyrus"
set :repo_url, "git@github.com:rpmvieira/papyrus.git"


set :ssh_options, {
  keys: %w(/home/corsariof/.ssh/id_rsa),


  forward_agent: false,
  auth_methods: %w(publickey)
}



# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"
set :rbenv_prefix, '/usr/bin/rbenv exec' # Cf issue: https://github.com/capistrano/rbenv/issues/96
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'






# 144.22.245.178





# # config valid for current version and patch releases of Capistrano
# lock "~> 3.17.1"

# set :application, "papyrus"
# set :repo_url, "git@github.com:rpmvieira/papyrus.git"


# set :ssh_options, {
#   keys: %w(/home/corsariof/.ssh/id_rsa),
#   # keys: %w(home/corsariof/keys/papyrus-ssh-key.key),

#   forward_agent: false,
#   auth_methods: %w(publickey)
# }

# # Deploy to the user's home directory
# set :deploy_to, "/home/deploy/#{fetch :application}"
# set :rbenv_prefix, '/usr/bin/rbenv exec' # Cf issue: https://github.com/capistrano/rbenv/issues/96
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# # Only keep the last 5 releases to save disk space
# set :keep_releases, 5

# # Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# # This is useful if you don't want to use ENV variables
# # append :linked_files, 'config/database.yml', 'config/secrets.yml'