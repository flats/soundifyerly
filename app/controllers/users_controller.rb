class UsersController < ApplicationController
  include Userable

  get '/' do
    @users = User.all
    erb :'users/index'
  end

  get '/new' do
    erb :'users/create'
  end

  post '/' do
    user = User.create(username: params[:user][:username], real_name: params[:user][:real_name], password: params[:user][:password], bio: params[:user][:bio])
    if user.save && user.username
      session[:id] = user.id
      flash[:alert] = "You are now registered."
      flash[:success] = true
      redirect "/users/#{user.username}"
    else
      redirect '/users/signup_failure'
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
    erb :'users/login'
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      flash[:alert] = "Welcome back, #{user.real_name}!"
      flash[:success] = true
      redirect "/users/#{user.username}"
    else
      flash[:alert] = "Your username or password was incorrect. Please try again."
      redirect '/users/login'
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get '/:username' do
    @user = User.includes(:sounds).find_by(username: params[:username])
    @leaders = @user.leaders.includes(:sounds) unless @user.leaders.empty?
    @followers = @user.followers unless @user.followers.empty?
    if @user
      erb :'users/show'
    else
      404
    end
  end

  post '/:username' do
    @user = User.find_by(username: params[:username])
    @user.update(username: params[:user][:username], real_name: params[:user][:real_name], bio: params[:user][:bio])
    flash[:alert] = "Account details updated."
    flash[:success] = true
    redirect "/users/#{@user.username}"
  end

  delete '/:username' do
    @user = User.find_by(username: params[:username])
    if @user
      @user.destroy
      redirect '/users/'
    else
      404
    end
  end

  get '/:username/edit' do
    @user = User.find_by(username: params[:username])
    if @user
      erb :'users/edit'
    else
      404
    end
  end

  get '/:username/follow' do
    @user = User.find_by(username: params[:username])
    if logged_in?
      unless current_user.leaders.include?(@user)
        @user.followers << current_user
      end
      redirect "/users/#{current_user.username}"
    else
      flash[:alert] = "You have to log in before following another user."
      redirect '/users/login'
    end
  end

  error 404 do
    'File not found'
  end
end