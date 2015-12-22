require "sinatra/activerecord/rake"

task :console do
  Pry.start
  # require_relative('config/environment')
end

namespace :db do
  task :load_config do
    Dir["app/models/*.rb"].each { |f| require f }
    Dir["app/controllers/*.rb"].each { |f| require f }
  end
end

# run bundle exec rake -T for rake tasks