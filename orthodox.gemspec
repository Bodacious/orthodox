# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "orthodox/version"

Gem::Specification.new do |spec|
  spec.name          = "orthodox"
  spec.version       = Orthodox::VERSION
  spec.authors       = ["Bodacious", 'CodeMeister']
  spec.email         = ["gavin@gavinmorrice.com"]

  spec.summary       = %q{Better Rails generators}
  spec.description   = %q{Replaces Rails generators with generators specific to my preferred workflow'}
  spec.homepage      = "https://github.com/Bodacious/orthodox"
  spec.license       = "MIT"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", 'lib/generators']
  spec.add_runtime_dependency 'slim-rails'
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", ">= 5.0"
end
