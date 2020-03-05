# -*- encoding: utf-8 -*-
# stub: dotenv-rails 2.7.5 ruby lib

Gem::Specification.new do |s|
  s.name = "dotenv-rails".freeze
  s.version = "2.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Keepers".freeze]
  s.date = "2019-07-31"
  s.description = "Autoload dotenv in Rails.".freeze
  s.email = ["brandon@opensoul.org".freeze]
  s.homepage = "https://github.com/bkeepers/dotenv".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14.4".freeze
  s.summary = "Autoload dotenv in Rails.".freeze

  s.installed_by_version = "2.6.14.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dotenv>.freeze, ["= 2.7.5"])
      s.add_runtime_dependency(%q<railties>.freeze, ["< 6.1", ">= 3.2"])
      s.add_development_dependency(%q<spring>.freeze, [">= 0"])
    else
      s.add_dependency(%q<dotenv>.freeze, ["= 2.7.5"])
      s.add_dependency(%q<railties>.freeze, ["< 6.1", ">= 3.2"])
      s.add_dependency(%q<spring>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<dotenv>.freeze, ["= 2.7.5"])
    s.add_dependency(%q<railties>.freeze, ["< 6.1", ">= 3.2"])
    s.add_dependency(%q<spring>.freeze, [">= 0"])
  end
end
