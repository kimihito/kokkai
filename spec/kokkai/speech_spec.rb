require "spec_helper"

RSpec.describe Kokkai::Speech do
  let(:raw_data) do
    fixture = File.join("spec", "fixtures", "speech_result.json")
    hash = nil
    File.open(fixture) do |f|
      hash = JSON.load(f)
    end
    hash["data"]["records"]["record"][0]["recordData"]
  end

  subject(:record) { described_class.new(raw_data) }

  describe '#speech' do
    it { expect(record.speech).to eq raw_data["speech"]}
  end
end