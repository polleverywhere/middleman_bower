# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/bower/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-bower"
  spec.version       = Middleman::Bower::VERSION
  spec.authors       = ["Brad Gessler"]
  spec.email         = ["brad@polleverywhere.com"]
  spec.description   = %q{Manage front-end assets and dependencies with bower.}
  spec.summary       = %q{Stop copying and pasting JavaScript files into your projects and start using Bower to manage dependencies.}
  spec.homepage      = "https://github.com/polleverywhere/middleman-bower"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
