$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'applications/hello_world'
app = Puma::Rack::Builder.app do
  if ENV['RACK_ENV'] == 'development'
    use Rack::Reloader
  else
    use Rack::CommonLogger
  end
  run HelloWorld
end

run app
