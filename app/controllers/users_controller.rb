class UsersController < ApplicationController
  get '/' do
    @users = User.all
    erb :'users/index'
  end

  get '/new' do
    erb :'users/create'
  end

  post '/' do
    @user = User.create(username: params[:user][:username], real_name: params[:user][:real_name], password: params[:user][:password])
    if user.save && user.username
      session[:id] = user.id
      redirect '/signup_success'
    else
      redirect '/signup_failure'
    end
  end

  get "/signup_success" do
    if logged_in?
      erb :'users/signup_success'
    else
      redirect "/users/login"
    end
  end

  get "/signup_failure" do
    erb :'users/signup_failure'
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/account'
    else
      redirect '/failure'
    end
  end

  get '/:username' do
    @user = User.find_by(username: params[:username])
    erb :'users/show'
  end

  post '/:username' do
    @user = User.update(username: params[:user][:username], real_name: params[:user][:real_name], password: params[:user][:password])
    redirect "/users/#{@user.username}"
  end

  get '/edit/:username' do
    @user = User.find_by(username: params[:username])
    if @user
      erb :'users/edit'
    else
      404
    end
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end
end