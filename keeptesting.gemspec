# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "keeptesting/version"

Gem::Specification.new do |s|
  s.name        = "keeptesting"
  s.version     = Keeptesting::VERSION
  s.authors     = ["Thomas Kjeldahl Nilsson"]
  s.email       = ["thomas@kjeldahlnilsson.net"]
  s.homepage    = "https://github.com/thomanil/keeptesting"
  s.summary     = %q{A platform/language agnostic autotest tool}
  s.description = %q{Usage: keeptesting [options] TESTCOMMAND}

  s.rubyforge_project = "keeptesting"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "fssm"

  s.add_development_dependency "mocha"
  s.add_development_dependency "minitest"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "shoulda-context"
end
