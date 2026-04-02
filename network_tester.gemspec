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
  spec.description   = %q{Continuously pings a host and announces response times. Alerts audibly when latency exceeds a threshold.}
  spec.homepage      = "https://github.com/brianmd/network_tester"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.7"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['network_tester']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
