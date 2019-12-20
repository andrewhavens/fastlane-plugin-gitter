# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/gitter/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-gitter'
  spec.version       = Fastlane::Gitter::VERSION
  spec.author        = 'Andrew Havens'
  spec.email         = 'email@andrewhavens.com'

  spec.summary       = 'A Fastlane plugin for sending a message to a Gitter room.'
  spec.homepage      = "https://github.com/andrewhavens/fastlane-plugin-gitter"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-gitter', '0.1.0'

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.136.0')
end
