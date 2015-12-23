require_relative 'config/environment'

# use IndexController
# run ApplicationController
# above checks these controllers in order

map "/" do
  run HomeController.new
end

map "/users" do
  run CocktailsController.new
end

map "/sounds" do
  run IngredientsController.new
end
