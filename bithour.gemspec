# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bithour/version'

Gem::Specification.new do |spec|
  spec.name = "bithour"
  spec.version = Bithour::VERSION
  spec.authors = ["Masafumi Yokoyama"]
  spec.email = ["myokoym@gmail.com"]

  spec.summary = "A library for range of hours in bits."
  spec.description = spec.summary
  spec.homepage = "https://github.com/myokoym/bithour"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) {|f| File.basename(f)}
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("test-unit-notify")
  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
end
