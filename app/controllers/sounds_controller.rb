class SoundsController < ApplicationController
  get '/' do
    "index"
  end

  get '/new' do
    erb :'sounds/new'
  end

  post '/new' do
    binding.pry
    File.open(UPLOAD_DIR + params[:sound][:soundfile][:filename], "w") do |f|
      f.write(params[:sound][:soundfile][:tempfile].read)
    end
    @sound = Sound.create(title: params[:sound][:title], soundfile: "#{UPLOAD_DIR}#{params[:sound][:soundfile][:filename]}")
    redirect '/'
  end

  get '/edit/:title'
    @sound = Sound.find_by(title: params[:title])
    if @sound
      erb :'sounds/edit'
    else
      404
    end
  end

  post '/:title'

  end

  delete '/:title'
    @sound = Sound.find_by(title: params[:title])
    if @sound
      @sound.destroy
      erb :'sounds/edit'
    end
  end

  error 404 do
    'File not found'
  end
end