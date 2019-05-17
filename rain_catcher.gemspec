# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rain_catcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'rain_catcher'
  spec.version       = RainCatcher::VERSION
  spec.authors       = ['Bob Farrell']
  spec.email         = ['robertanthonyfarrell@gmail.com']
  spec.licenses      = ['MIT']

  spec.summary       = 'Automatically log Raindrops statistics'
  spec.description   = 'Rails application statistic logging with Raindrops'
  spec.homepage      = 'https://github.com/bobf/rain_catcher'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '~> 5.0'
  spec.add_runtime_dependency 'raindrops', '~> 0.19.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'byebug', '~> 11.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.3'
  spec.add_development_dependency 'rubocop', '~> 0.69.0'
  spec.add_development_dependency 'strong_versions', '~> 0.3.2'
end
