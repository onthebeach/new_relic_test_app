$:.unshift(File.join(File.dirname(__FILE__), '../../lib'))
require 'new_relic_test'
NewRelicTest::Dependencies.configure(:Monitoring)
preload_app!
tag 'hello_world'
