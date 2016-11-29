$:.unshift(File.join(File.dirname(__FILE__), '../../lib'))
require 'new_relic_test'
preload_app!
tag 'hello_world'
on_worker_boot do
  require 'newrelic_rpm'
  NewRelic::Agent.manual_start
end
