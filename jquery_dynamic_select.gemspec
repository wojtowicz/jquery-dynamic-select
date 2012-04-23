# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jquery_dynamic_select/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Wójtowicz Tomasz"]
  gem.email         = ["tomash2310w@gmail.com"]
  gem.description   = %q{jQuery dynamic select in Rails 3 }
  gem.summary       = %q{jQuery dynamic select in Rails 3 }
  gem.homepage      = "http://e-wojtowicz.pl"
  
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jquery_dynamic_select"
  gem.require_paths = ["lib"]
  gem.version       = JqueryDynamicSelect::VERSION
end
