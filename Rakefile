# -*- ruby -*-

require "rubygems"
require "hoe"

Hoe.plugin :git
Hoe.plugin :gemspec
Hoe.plugin :travis
Hoe.plugins.delete :rubyforge

Hoe.spec 'minitest-shouldify' do
  developer "Mike Moore", "mike@blowmage.com"

  self.summary     = "Its a bad idea"
  self.description = "Adding all manner of shoulds to MiniTest"
  self.urls        = ["http://blowmage.com/minitest-rails-shoulda"]

  self.history_file = "CHANGELOG.rdoc"
  self.readme_file  = "README.rdoc"
  self.testlib      = :minitest

  dependency "minitest", "~> 3.5"
end

# vim: syntax=ruby
