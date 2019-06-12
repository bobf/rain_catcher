# frozen_string_literal: true

module RaindropsStubbing
  def stub_raindrops(result = default_result)
    linux = Raindrops::Linux
    allow(linux).to receive(:respond_to?).with(:tcp_listener_stats) { true }
    allow(linux).to receive(:tcp_listener_stats) { result }
  end

  private

  def default_result
    { '0.0.0.0:8080' => Struct.new(:queued, :active).new(0, 0) }
  end
end
