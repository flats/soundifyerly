class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :method_override
  set :root, File.dirname(File.expand_path('..', __FILE__))
  set :public_folder, Proc.new { File.join(File.expand_path('.', "public")) }
  enable :static
  configure :production, :development do
    enable :logging
    enable :sessions
    set :session_secret, "n6s2dHwPdj2fgF1m"
  end
end