# frozen_string_literal: true

RSpec.describe RainCatcher::Railtie do
  subject(:railtie) { described_class }

  its(:initializers) { is_expected.to be_an Array }

  describe 'initializer' do
    subject(:initializer) { described_class.initializers.first }
    it { is_expected.to_not be_nil }
    its(:name) { is_expected.to eql :rain_catcher }
  end
end
