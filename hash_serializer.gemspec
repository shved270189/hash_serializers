# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_serializer'

Gem::Specification.new do |spec|
  spec.name          = "hash_serializer"
  spec.version       = HashSerializer::VERSION
  spec.authors       = ["Ivan Bondarenko"]
  spec.email         = ["bondarenko.dev@gmail.com"]

  spec.summary       = %q{Hash to JSON Serializer.}
  spec.description   = %q{Hash to JSON Serializer.}
  # spec.homepage      = "Put your gem's website or public repo URL here." # TODO
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_bot"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
end
