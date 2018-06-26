require "spec_helper"

RSpec.describe Kokkai::Meeting do
  let(:raw_data) do
    fixture = File.join("spec", "fixtures", "meeting_result.json")
    hash = nil
    File.open(fixture) do |f|
      hash = JSON.load(f)
    end
    hash["data"]["records"]["record"][0]
  end

  subject(:record) { described_class.new(raw_data) }

  describe '#meeting_url' do
    it { expect(record.meeting_url).to eq raw_data["recordData"]["meetingRecord"]["meetingURL"] }
  end

  describe '#speeches' do
    it { expect(record.speeches[0]).to be_a(Kokkai::Speech) }
    it { expect(record.speeches[1].speaker).to eq raw_data["recordData"]["meetingRecord"]["speechRecord"][1]["speaker"] }
  end
end