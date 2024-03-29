# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rain_catcher/version'

# rubocop:disable Metrics/BlockLength
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
  spec.required_ruby_version = '>= 2.5.9'

  spec.add_runtime_dependency 'rails', '>= 4.0'
  spec.add_runtime_dependency 'raindrops', '~> 0.19.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'devpack', '~> 0.4.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.3'
  spec.add_development_dependency 'rubocop', '~> 1.27'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.9'
  spec.add_development_dependency 'strong_versions', '~> 0.4.5'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
# rubocop:enable Metrics/BlockLength
