# frozen_string_literal: true

module RainCatcher
  class Railtie < Rails::Railtie
    initializer :rain_catcher do
      notifications.subscribe('process_action.action_controller') do |_args|
        log_if_interval_elapsed
      end
    end

    private

    def notifications
      ActiveSupport::Notifications
    end

    def log_if_interval_elapsed
      return unless elapsed?

      Rails.logger.send(level, queue_data.to_json)
      @last_logged = Time.now.utc
    end

    def queue_data
      Raindrops::ListenStats.new(0, 0).to_h.merge(
        source: 'rain_catcher',
        application: application_name,
        environment: Rails.env.to_s
      )
    end

    def elapsed?
      return true if @last_logged.nil?
      return true if (Time.now.utc - @last_logged).seconds >= interval

      false
    end

    def interval
      @interval ||= ENV.fetch('RAIN_CATCHER_LOG_INTERVAL', '30').to_i
    end

    def level
      @level ||= ENV.fetch('RAIN_CATCHER_LOG_LEVEL', 'INFO').downcase.to_sym
    end

    def application_name
      @application_name ||= ENV.fetch(
        'RAIN_CATCHER_APPLICATION_NAME',
        Rails.application.class.name.split('::').first.downcase
      )
    end
  end
end
