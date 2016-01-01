class SoundsController < ApplicationController
  include Userable
  
  get '/' do
    @sounds = Sound.all
    erb :'sounds/index'
  end

  get '/new' do
    erb :'sounds/create'
  end

  post '/' do
    @sound = Sound.create(title: params[:sound][:title], soundfile: "#{params[:sound][:soundfile][:filename]}")
    @sound.write_attached_file(tempfile: params[:sound][:soundfile][:tempfile])
    # TODO: check for write success - maybe use return value, which is file
    # size in bytes? Maybe use File.exists?
    redirect "/sounds/#{@sound.id}"
  end

  get '/:id' do
    @sound = Sound.find(params[:id])
    erb :'sounds/show'
  end

  post '/:id' do
    @sound = Sound.find(params[:id])
    404 if !@sound
    unless params[:sound][:soundfile].nil?
      Sound.delete_attached_file(@sound)
      @sound.update(title: params[:sound][:title], soundfile: params[:sound][:soundfile][:filename])
      @sound.write_attached_file(tempfile: params[:sound][:soundfile][:tempfile])
    else
      @sound.title = params[:sound][:title]
      @sound.save
    end
    redirect "/sounds/#{@sound.id}"
  end

  delete '/:id' do
    @sound = Sound.find(params[:id])
    if @sound
      # TODO: add to destroy callback?
      @sound.delete_attached_file
      @sound.destroy
      redirect '/sounds/'
    else
      404
    end
  end

  get '/:id/edit' do
    @sound = Sound.find(params[:id])
    if @sound
      erb :'sounds/edit'
    else
      404
    end
  end

  error 404 do
    'File not found'
  end

  # helpers do
  #   def logged_in?
  #     !!session[:id]
  #   end

  #   def current_user
  #     User.find(session[:id])
  #   end
  # end
end