require "vianettsms"
require 'webmock/rspec'

WebMock.allow_net_connect!

::VIANETTSMS_ENABLED = ENV["VIANETSMS_ENABLED"] == "true"  #DISABLED BY DEFAULT

if ::VIANETTSMS_ENABLED
  puts "============ VIANETTSMS HTTP API IS ENABLED  ================"
else
  puts "============ VIANETTSMS HTTP API IS DISABLED  ================" 
end

RSpec.configure do |c|
  c.filter_run_excluding :vianettsms => true unless ::VIANETTSMS_ENABLED
end


