class HomeController < ApplicationController
  include Userable
  
  get '/' do
    erb :'index'
  end
end