# frozen_string_literal: true

require 'bundler/setup'
require 'rspec/its'
require 'rain_catcher'

Dir[File.join(__dir__, 'support', '**', '*.rb')].each { |f| require f }

# See spec/support/raindrops_stubbing.rb
module Unicorn
  def self.listener_names
    ['0.0.0.0:8080']
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.include RaindropsStubbing

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
