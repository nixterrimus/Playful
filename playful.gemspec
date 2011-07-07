# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "playful/version"

Gem::Specification.new do |s|
  s.name        = "playful"
  s.version     = Playful::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Rowe"]
  s.email       = ["nixterrimus@dcxn.com"]
  s.homepage    = "http://dcxn.com"
  s.summary     = %q{Numbers, only better}
  s.description = %q{Playful turns numbers into words}

  s.rubyforge_project = "playful"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
