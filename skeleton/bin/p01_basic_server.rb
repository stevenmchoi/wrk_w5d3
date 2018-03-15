require 'rack'
require "byebug"

app = Proc.new do |env|
  # debugger
  req = Rack::Request.new(env)

  if req.path_info == '/'
    path_text = 'Hello world!'
  else
    path_text = req.path_info
  end

  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(path_text)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)

# TODO: localhost:3000/i/love/app/academy
