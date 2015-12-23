class SoundsController < ApplicationController
  get '/new' do
    erb :'sounds/new.erb'
  end
end