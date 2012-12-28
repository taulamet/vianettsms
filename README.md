vianettsms
==========

Gem for send sms messages using Vianett service from ruby. 
(Web site: http://www.vianett.com/)

Installation
============

From rubygems

    gem install vianettsms

or from github: You install the gem in your rails app by adding it your Gemfile:

    gem 'vianettsms', :git => 'git://github.com/taulamet/vianettsms.git'

    bundle install


Ruby sample script
==================

    require 'rubygems'
    require 'vianettsms'

    # Account Configuration
    Vianettsms.config = { :username => "testaccount@demo.com", :password => "secret" }

    # sms creation
    sms = Vianettsms::Sms.new(:to => "543424555555", :message => "Aloha!", :msgid => "1234")

    sms.deliver
    
Testing
=======
    rspec spec # Mocking Vianett API
    VIANETSMS_ENABLED=true rspec spec # Using Vianett API (require valid credentials to work)
