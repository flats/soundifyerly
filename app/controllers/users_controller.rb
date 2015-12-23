class UsersController
  def call(env)
    request = Rack::Request.new(env)
    if request.path == "/" && request.get?
      index
    else
      Rack::Response.new("File not found", 404)
    end
  end

  def index
    Rack::Response.new("<a href='/users'>Users</a>")
  end
end