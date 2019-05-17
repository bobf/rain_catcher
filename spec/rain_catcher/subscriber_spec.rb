# frozen_string_literal: true

RSpec.describe RainCatcher::Subscriber do
  subject(:subscriber) { described_class.new(options) }

  before do
    allow(Rails).to receive(:logger) { logger }
  end

  let(:logger) { double }

  let(:options) do
    {
      interval: 10,
      log_level: 'INFO',
      application_name: 'testapp',
      environment: 'test'
    }
  end

  it { is_expected.to be_a described_class }

  describe '#log_if_interval_elapsed' do
    subject(:log_if_interval_elapsed) { subscriber.log_if_interval_elapsed }

    it 'logs on first request' do
      expect(logger).to receive(:info)
      log_if_interval_elapsed
    end

    shared_examples 'a log entry' do |hash|
      it "logs expected values #{hash}" do
        expect(logger).to receive(:info).with(any_args) do |args|
          expect(JSON.parse(args, symbolize_names: true)).to include hash
        end
        log_if_interval_elapsed
      end
    end

    it_behaves_like 'a log entry', application: 'testapp'
    it_behaves_like 'a log entry', environment: 'test'
    it_behaves_like 'a log entry', source: 'rain_catcher'
  end
end
