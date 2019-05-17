# frozen_string_literal: true

module RainCatcher
  class Subscriber
    def initialize(options)
      @interval = options.fetch(:interval)
      @log_level = options.fetch(:log_level).to_s.downcase.to_sym
      @application_name = options.fetch(:application_name)
      @environment = options.fetch(:environment)
      @last_logged = nil
    end

    def log_if_interval_elapsed
      return unless elapsed?

      Rails.logger.send(@log_level, queue_data.to_json)
      @last_logged = Time.now.utc
    end

    private

    def queue_data
      Raindrops::ListenStats.new(0, 0).to_h.merge(
        source: 'rain_catcher',
        application: @application_name,
        environment: @environment
      )
    end

    def elapsed?
      return true if @last_logged.nil?
      return true if (Time.now.utc - @last_logged).seconds >= @interval

      false
    end
  end
end
