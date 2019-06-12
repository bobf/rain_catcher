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

      data = queue_data
      return if data.nil?

      Rails.logger.send(@log_level, data.to_json)
      @last_logged = Time.now.utc
    end

    private

    def queue_data
      return nil unless Raindrops::Linux.respond_to?(:tcp_listener_stats)

      Raindrops::Linux.tcp_listener_stats.to_h.merge(
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
