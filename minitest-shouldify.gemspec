# -*- encoding: utf-8 -*-
# stub: minitest-shouldify 2.0.0.20160805230022 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-shouldify".freeze
  s.version = "2.0.0.20160805230022"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mike Moore".freeze]
  s.date = "2016-08-06"
  s.description = "Adding all manner of shoulds to Minitest".freeze
  s.email = ["mike@blowmage.com".freeze]
  s.extra_rdoc_files = ["CHANGELOG.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = [".autotest".freeze, ".travis.yml".freeze, "CHANGELOG.rdoc".freeze, "Gemfile".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "lib/minitest-shouldify.rb".freeze, "lib/minitest/shouldify.rb".freeze, "minitest-shouldify.gemspec".freeze, "test/helper.rb".freeze, "test/test_must_not.rb".freeze, "test/test_sanity.rb".freeze, "test/test_shall.rb".freeze, "test/test_shouldify.rb".freeze, "test/test_to.rb".freeze, "test/test_wimpy.rb".freeze]
  s.homepage = "http://blowmage.com/minitest-shouldify".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Its a bad idea".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<minitest-autotest>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<minitest-matchers>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<minitest-autotest>.freeze, ["~> 1.0"])
      s.add_dependency(%q<minitest-matchers>.freeze, ["~> 1.4"])
      s.add_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<minitest-autotest>.freeze, ["~> 1.0"])
    s.add_dependency(%q<minitest-matchers>.freeze, ["~> 1.4"])
    s.add_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
