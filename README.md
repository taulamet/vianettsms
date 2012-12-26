vianettsms
==========

Gem for send sms messages using Vianett service from ruby.

= Installation on Rails App

You install the gem in your rails app by adding it your +Gemfile+:

    gem 'vianettsms', :git => 'git://github.com/taulamet/vianettsms.git'

and running

    bundle install

= Usage

Account Configuration

Vianettsms.config = { :username => "testaccount@demo.com", :password => "secret" }

Sms Deliver

sms = Vianettsms::Sms.new(:to => "543424555555", :message => "Aloha!", :msgid => "1234")

sms.deliver
#

