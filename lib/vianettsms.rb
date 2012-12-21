require "vianettsms/version"
require "vianettsms/sms"
require "net/http"
require "rubygems"
require "xmlsimple"

module Vianettsms

  class << self; attr_accessor :config, :url end 

  @url = 'http://smsc.vianett.no/V3/CPA/MT/MT.ashx' 

  @config = {:username => "", :password => ""}

end
