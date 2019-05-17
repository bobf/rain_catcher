# frozen_string_literal: true

module RainCatcher
  class Railtie < Rails::Railtie
    initializer :rain_catcher do
      notifications.subscribe('process_action.action_controller') do |_args|
        subscriber.log_if_interval_elapsed
      end
    end

    class << self
      private

      def subscriber
        @subscriber ||= RainCatcher::Subscriber.new(
          interval: interval,
          log_level: log_level,
          application_name: application_name,
          environment: Rails.env.to_s
        )
      end

      def notifications
        ActiveSupport::Notifications
      end

      def interval
        ENV.fetch('RAIN_CATCHER_LOG_INTERVAL', '30').to_i
      end

      def log_level
        ENV.fetch('RAIN_CATCHER_LOG_LEVEL', 'INFO')
      end

      def application_name
        ENV.fetch(
          'RAIN_CATCHER_APPLICATION_NAME',
          Rails.application.class.name.split('::').first.downcase
        )
      end
    end
  end
end
