require 'racklet'
require 'new_relic_test/dependencies'

class HelloWorld < Racklet::Application

  before Racklet::Middleware::Status, test: -> { true }
  after Racklet::Middleware::Headers::ContentType, content_type: 'text/html'

  def response(env)
    [200, {}, ["Hello World!"]]
  end
end
