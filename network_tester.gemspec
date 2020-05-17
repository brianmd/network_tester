# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'network_tester/version'

Gem::Specification.new do |spec|
  spec.name          = "network_tester"
  spec.version       = NetworkTester::VERSION
  spec.authors       = ["bmd"]
  spec.email         = ["brian@murphydye.com"]

  spec.summary       = %q{Test network with audible pings.}
  spec.description   = %q{}
  spec.homepage      = ''
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ['network_tester']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec"
end
