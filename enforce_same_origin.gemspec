# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enforce_same_origin/version'

Gem::Specification.new do |spec|
  spec.name          = "enforce_same_origin"
  spec.version       = EnforceSameOrigin::VERSION
  spec.authors       = ["Patrick Tulskie"]
  spec.email         = ["patricktulskie@gmail.com"]
  spec.summary       = %q{Globally set X-FRAME-OPTIONS to SAMEORIGIN.}
  spec.description   = %q{Rack middleware that globally sets your Rack compatible app to always have X-FRAME-OPTIONS set to SAMEORIGIN.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
