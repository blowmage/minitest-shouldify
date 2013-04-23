# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "minitest-shouldify"
  s.version = "1.1.0.20130423160652"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Moore"]
  s.date = "2013-04-23"
  s.description = "Adding all manner of shoulds to MiniTest"
  s.email = ["mike@blowmage.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", ".travis.yml", "CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "lib/minitest-shouldify.rb", "lib/minitest/shouldify.rb", "minitest-shouldify.gemspec", "test/test_helper.rb", "test/test_must_not.rb", "test/test_sanity.rb", "test/test_shall.rb", "test/test_shouldify.rb", "test/test_wimpy.rb", ".gemtest"]
  s.homepage = "http://blowmage.com/minitest-rails-shoulda"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "minitest-shouldify"
  s.rubygems_version = "2.0.3"
  s.summary = "Its a bad idea"
  s.test_files = ["test/test_helper.rb", "test/test_must_not.rb", "test/test_sanity.rb", "test/test_shall.rb", "test/test_shouldify.rb", "test/test_wimpy.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 4.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<minitest-matchers>, ["~> 1.2"])
      s.add_development_dependency(%q<hoe>, ["~> 3.6"])
    else
      s.add_dependency(%q<minitest>, ["~> 4.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<minitest-matchers>, ["~> 1.2"])
      s.add_dependency(%q<hoe>, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 4.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<minitest-matchers>, ["~> 1.2"])
    s.add_dependency(%q<hoe>, ["~> 3.6"])
  end
end
