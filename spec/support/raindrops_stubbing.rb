# frozen_string_literal: true

module RaindropsStubbing
  def stub_raindrops(result = {})
    linux = Raindrops::Linux
    allow(linux).to receive(:respond_to?).with(:tcp_listener_stats) { true }
    allow(linux).to receive(:tcp_listener_stats) { result }
  end
end
