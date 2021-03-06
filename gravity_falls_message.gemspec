# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gravity_falls_message/version'

Gem::Specification.new do |spec|
  spec.name          = "gravity_falls_message"
  spec.version       = GravityFallsMessage::VERSION
  spec.authors       = ["Brian Hall"]
  spec.email         = ["brian@brianhalldeveloper.com"]
  spec.summary       = %q{A gem to encode and decode messages using the ciphers as presented on Disney XD's show Gravity Falls.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = '~> 2.1.2'
  spec.test_files = Dir.glob("test/**/*")
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest-reporters', '~> 1.0.6'
  spec.add_development_dependency 'shoulda', '~> 3.5.0'
  spec.add_development_dependency 'pry'
end
