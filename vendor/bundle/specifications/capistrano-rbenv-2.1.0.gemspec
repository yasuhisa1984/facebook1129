# -*- encoding: utf-8 -*-
# stub: capistrano-rbenv 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-rbenv".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kir Shatrov".freeze, "Yamashita Yuu".freeze]
  s.date = "2016-12-04"
  s.description = "rbenv integration for Capistrano".freeze
  s.email = ["shatrov@me.com".freeze, "yamashita@geishatokyo.com".freeze]
  s.homepage = "https://github.com/capistrano/rbenv".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "rbenv integration for Capistrano".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<sshkit>.freeze, ["~> 1.3"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["~> 3.1"])
      s.add_dependency(%q<sshkit>.freeze, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.1"])
    s.add_dependency(%q<sshkit>.freeze, ["~> 1.3"])
  end
end
