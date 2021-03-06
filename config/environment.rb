require 'bundler/setup'
Bundler.require

ENV["SINATRA_ENV"] ||= "development"
ENV["RACK_ENV"] ||= "development"

# ActiveRecord::Base.establish_connection(
#   adapter: "sqlite3",
#   database: "db/get_crunked_development.db"
# )

# require "sinatra/activerecord"

# config.active_record.raise_in_transactional_callbacks = true
# set :database, {adapter: "sqlite3", database: "db/soundifyerly.sqlite3"}

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.raise_in_transactional_callbacks = true

# $LOAD_PATH
$: << '.'

Dir["app/concerns/*.rb"].each { |f| require f }
Dir["app/models/*.rb"].each { |f| require f }
Dir["app/controllers/*.rb"].each { |f| require f }

UPLOAD_DIR = 'public/system/uploads/'