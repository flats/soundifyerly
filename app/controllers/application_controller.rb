class ApplicationController < Sinatra::Base
  # just settings in here - could add generic routes in here
  enable :method_override
  # app_dir = File.dirname(__FILE__)
  # set :root, File.join(app_dir, "..")
  set :root, File.join(__dir__, "..")
  configure :production, :development do
    enable :logging
  end
end