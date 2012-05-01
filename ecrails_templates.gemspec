# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ecrails_templates/version"

Gem::Specification.new do |s|
  s.name        = "ecrails_templates"
  s.version     = EcrailsTemplates::VERSION
  s.authors     = ["Adrian Mowat"]
  s.email       = ["adrian@edgecase.com"]
  s.homepage    = "http://edgecase.com/"
  s.summary     = %q{EdgeCase UK rails templates and other stuff}
  s.description = %q{EdgeCase UK rails templates and other stuff}

  s.rubyforge_project = "ecrails_templates"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
