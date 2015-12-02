# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/error_to_slack/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-error_to_slack'
  spec.version       = Rack::ErrorToSlack::VERSION
  spec.authors       = ['showwin']
  spec.email         = ['showwin_kmc@yahoo.co.jp']

  spec.summary       = %q{rack middleware to post error to slack}
  spec.description   = %q{this is a rack middleware to post error to slack}
  spec.homepage      = 'https://github.com/showwin/rack-error_to_slack'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'uri'
end
