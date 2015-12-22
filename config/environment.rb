require 'bundler/setup'
Bundler.require

# ActiveRecord::Base.establish_connection(
#   adapter: "sqlite3",
#   database: "db/get_crunked_development.db"
# )

require "sinatra/activerecord"
config.active_record.raise_in_transactional_callbacks = true
# set :database, {adapter: "sqlite3", database: "db/soundifyerly.sqlite3"}

# $LOAD_PATH
$: << '.'
Dir["app/models/*.rb"].each { |f| require f }