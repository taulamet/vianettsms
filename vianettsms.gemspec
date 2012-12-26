# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vianettsms/version"

Gem::Specification.new do |s|
  s.name        = "vianettsms"
  s.version     = Vianettsms::VERSION
  s.authors     = ["Juan Pablo Taulamet"]
  s.email       = ["taulamet@gmail.com"]
  s.homepage    = "https://github.com/taulamet/vianettsms"
  s.summary     = %q{Send sms messages using Vianett service from ruby}
  s.description = %q{Send sms messages using Vianett service from ruby}

  s.rubyforge_project = "vianettsms"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.11"
  s.add_development_dependency "webmock"
  s.add_dependency "xml-simple"
  # s.add_runtime_dependency "rest-client"
end
