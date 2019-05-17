# frozen_string_literal: true

require 'rails'
require 'raindrops'

require 'rain_catcher/version'
require 'rain_catcher/railtie'
require 'rain_catcher/subscriber'

module RainCatcher
  class Error < StandardError; end
end
