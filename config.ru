require_relative 'config/environment'
Dir["app/controllers/*.rb"].each { |f| require f }