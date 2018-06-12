require "spec_helper"

RSpec.describe Kokkai::Record do
  let(:raw_data) do
    fixture = File.join("spec", "fixtures", "speech_result.json")
    hash = nil
    File.open(fixture) do |f|
      hash = JSON.load(f)
    end
    hash["data"]["records"]["record"][0]
  end

  subject(:record) { described_class.new(raw_data) }

  describe '#raw' do
    it { expect(record.raw).to eq raw_data }
  end

  describe '#raw_record' do
    it { expect(record.raw_record).to eq raw_data["recordData"] }
  end

  describe "#session" do
    it { expect(record.session).to eq raw_data["recordData"]["session"] }
  end
end