# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack-sni/version"

Gem::Specification.new do |s|
  s.name        = "rack-sni"
  s.version     = Rack::SNI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Hanks"]
  s.email       = ["christopher.m.hanks@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Force SSL in your app when SNI is supported.}
  s.description = %q{A small Rack middleware that forces the use of SSL (via Rack::SSL) if and only if the client supports SNI.}

  s.rubyforge_project = "rack-sni"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
