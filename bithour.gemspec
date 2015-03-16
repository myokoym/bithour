# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bithour/version'

Gem::Specification.new do |spec|
  spec.name = "bithour"
  spec.version = Bithour::VERSION
  spec.authors = ["Masafumi Yokoyama"]
  spec.email = ["myokoym@gmail.com"]

  spec.summary = "A library that handles hours range as bytes."
  spec.description = spec.summary
  spec.homepage = "https://github.com/myokoym/bithour"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("test-unit-notify")
  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
end
