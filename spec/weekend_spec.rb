require 'spec_helper'

describe Weekend do
  context 'initialize' do
    let(:eastern_time) { 'Eastern Time (US & Canada)' }
    let(:pacific_time) { 'Pacific Time (US & Canada)' }

    it 'captures the current time' do
      # June 22, 2016 8:54 pm EDT
      allow(Time).to receive(:now).and_return Time.new(2016, 06, 22, 20, 54, 00, '-04:00')
      weekend = Weekend.new
      expect(weekend.time).to eq Time.new(2016, 06, 22, 20, 54, 00, '-04:00')
    end

    it 'applies the timezone to the current time' do
      # June 22, 2016 8:54 pm EDT
      allow(Time).to receive(:now).and_return Time.new(2016, 06, 22, 20, 54, 00, '-04:00')
      weekend = Weekend.new pacific_time
      expect(weekend.time).to eq Time.new(2016, 06, 22, 17, 54, 00, '-07:00')
    end
  end
end
