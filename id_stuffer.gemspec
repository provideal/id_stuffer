# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "id_stuffer"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.summary     = "a reasonable way to compress sequences of ids for parameter encoding"
  s.email       = "info@provideal.net"
  s.homepage    = "http://github.com/provideal/id_stuffer"
  s.description = "a way to efficiently store ids (i.e., possibly sequential numbers > 0), well suited for params-ecoding. Note that the ids will be sorted and uniqued"
  s.authors     = ['Peter Horn']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
