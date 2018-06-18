require "spec_helper"

RSpec.describe Kokkai::Speech do
  let(:raw_data) do
    fixture = File.join("spec", "fixtures", "speech_result.json")
    hash = nil
    File.open(fixture) do |f|
      hash = JSON.load(f)
    end
    hash["data"]["records"]["record"][0]
  end

  subject(:record) { described_class.new(raw_data) }

  describe '#speech' do
    it { expect(record.speech).to eq raw_data["recordData"]["speechRecord"]["speech"] }
  end

  describe '#meeting_url' do
    it { expect(record.meeting_url).to eq raw_data["recordData"]["speechRecord"]["meetingURL"] }
  end
end