class UsersController < ApplicationController
  get '/' do
    "index"
  end

  get '/new' do
    erb :'users/create'
  end

  get '/edit/:username' do
    @user = User.find_by(username: params[:username])
    if @sound
      erb :'users/edit'
    else
      404
    end
  end

  get '/:username' do
    @user = User.find_by(username: params[:username])
    erb :'users/show'
  end
end