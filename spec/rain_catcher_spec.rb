# frozen_string_literal: true

RSpec.describe RainCatcher do
  it 'has a version number' do
    expect(RainCatcher::VERSION).not_to be nil
  end

  let(:logger) { double }

  describe 'event logging' do
    before do
      allow(Rails).to receive(:logger) { logger }
    end

    it 'logs on request process event' do
      expect(logger).to receive(:info)
      RainCatcher::Railtie.instance.instance_eval(
        &RainCatcher::Railtie.initializers.first.block
      )
      ActiveSupport::Notifications.instrument(
        'process_action.action_controller'
      )
    end
  end
end
