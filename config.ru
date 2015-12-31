require_relative 'config/environment'

# use HomeController
# use SoundsController
# use UsersController
# run ApplicationController

# above checks these controllers in order

map "/" do
  run HomeController.new
end

map "/users" do
  run UsersController.new
end

map "/sounds" do
  run SoundsController.new
end
