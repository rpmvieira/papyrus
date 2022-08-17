# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rbenv"
require "capistrano/rails"
require "capistrano/passenger"
require 'capistrano/ssh_doctor'

set :rbenv_type, :user
set :rbenv_ruby, '3.1.1'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
