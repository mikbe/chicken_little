# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{chicken_little}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Bethany"]
  s.date = %q{2011-05-12 00:00:00.000000000Z}
  s.default_executable = %q{chicken_little}
  s.description = %q{A simple hack to disable the incredibly annoying deprecation warnings for Gem::Specification#default_executable= when using the gem command.}
  s.email = ["mikbe.tk@gmail.com"]
  s.executables = ["chicken_little"]
  s.files = ["bin/chicken_little"]
  s.homepage = %q{http://mikbe.tk}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Disables the annoying Gem::Specification#default_executable= warnings when running gem.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<commandable>, [">= 0"])
      s.add_runtime_dependency(%q<term-ansicolor-hi>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<commandable>, [">= 0"])
      s.add_dependency(%q<term-ansicolor-hi>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<commandable>, [">= 0"])
    s.add_dependency(%q<term-ansicolor-hi>, [">= 0"])
  end
end
