require_relative 'config/environment'
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    Dir["app/models/*.rb"].each { |f| require f }
    Dir["app/controllers/*.rb"].each { |f| require f }
  end
end

desc "opens a Pry console"
task :console do
  require_relative 'config/environment'
  Pry.start
end

# run bundle exec rake -T for rake tasks