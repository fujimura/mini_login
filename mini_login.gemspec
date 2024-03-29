# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mini_login/version"

Gem::Specification.new do |s|
  s.name        = "mini_login"
  s.version     = MiniLogin::VERSION
  s.authors     = ["Fujimura Daisuke"]
  s.email       = ["dfujimura@aiming-inc.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "mini_login"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "> 3.0.0"
  s.add_development_dependency "sqlite3", "~> 1.3.4"
  s.add_development_dependency "database_cleaner", "~> 0.6.7"
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_development_dependency "rspec-rails", "~> 2.6.1"
  s.add_development_dependency "factory_girl", "~> 2.0.4"
  s.add_development_dependency "shoulda", "~> 2.11.3"
  s.add_development_dependency "watchr"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
