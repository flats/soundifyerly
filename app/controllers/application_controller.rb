class ApplicationController < Sinatra::Base
  enable :method_override
  set :root, File.dirname(File.expand_path('..', __FILE__))
  set :public_folder, Proc.new { File.join(File.expand_path('.', "public")) }
  enable :static
  configure :production, :development do
    enable :logging
  end
end