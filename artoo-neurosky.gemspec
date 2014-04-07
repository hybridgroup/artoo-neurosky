# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-neurosky/version"

Gem::Specification.new do |s|
  s.name        = "artoo-neurosky"
  s.version     = Artoo::Neurosky::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ron Evans"]
  s.email       = ["artoo@hybridgroup.com"]
  s.homepage    = "https://github.com/hybridgroup/artoo-neurosky"
  s.license     = "Apache 2.0"
  s.summary     = %q{Artoo adaptor and driver for Neurosky}
  s.description = %q{Artoo adaptor and driver for Neurosky}

  s.rubyforge_project = "artoo-neurosky"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '>= 1.6.4'
  s.add_runtime_dependency 'mindset'
  # TODO: add your development dependencies here
  # EXAMPLE:
  # s.add_development_dependency 'minitest', '>= 5.0'
  # s.add_development_dependency 'minitest-happy'
  # s.add_development_dependency 'mocha', '>= 0.14.0'
end
