# -*- ruby -*-

require "rubygems"
require "hoe"

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugin :travis

Hoe.spec 'minitest-shouldify' do
  developer "Mike Moore", "mike@blowmage.com"

  self.summary     = "Its a bad idea"
  self.description = "Adding all manner of shoulds to Minitest"
  self.urls        = ["http://blowmage.com/minitest-shouldify"]

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  dependency "minitest", "~> 5.8"
  dependency "minitest-autotest", "~> 1.0", :dev
  dependency "minitest-matchers", "~> 1.4", :dev
  dependency "minitest-rg",       "~> 5.2", :dev
end

# vim: syntax=ruby
