require "vianettsms"
require 'webmock/rspec'

WebMock.allow_net_connect!

::VIANETTSMS_ENABLED = ENV["VIANETSMS_ENABLED"] == "true"  #DISABLED BY DEFAULT
puts "============ VIANETTSMS IS DISABLED  ================" unless ::VIANETTSMS_ENABLED

RSpec.configure do |c|
  c.filter_run_excluding :vianettsms => true unless ::VIANETTSMS_ENABLED
end


