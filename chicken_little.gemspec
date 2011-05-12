# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chicken_little/version"

Gem::Specification.new do |s|
  s.name        = "chicken_little"
  s.version     = ChickenLittle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = %q{2011-05-12}
  s.required_ruby_version   = '>= 1.9.2'
  s.authors     = ["Mike Bethany"]
  s.email       = ["mikbe.tk@gmail.com"]
  s.homepage    = "http://mikbe.tk"
  s.summary     = %q{Disables the annoying Gem::Specification#default_executable= warnings when running gem.}
  s.description = %q{A simple hack to disable the incredibly annoying deprecation warnings for Gem::Specification#default_executable= when using the gem command.}

  s.license = 'MIT'

  s.add_dependency("bundler")
  s.add_dependency("commandable")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
