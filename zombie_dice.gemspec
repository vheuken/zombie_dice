# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zombie_dice/version'

Gem::Specification.new do |spec|
  spec.name          = "zombie_dice"
  spec.version       = ZombieDice::VERSION
  spec.authors       = ["Vincent Heuken"]
  spec.email         = ["me@vincentheuken.com"]
  spec.summary       = %q{Gem for playing the tabletop game Zombie Dice}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "zlib"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
