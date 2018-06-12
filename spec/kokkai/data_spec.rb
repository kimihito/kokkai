require "spec_helper"

RSpec.describe Kokkai::Data do
  let(:raw_data) do
    fixture = File.join("spec", "fixtures", "speech_result.json")
    hash = nil
    File.open(fixture) do |f|
      hash = JSON.load(f)
    end
    hash
  end

  subject(:data) { described_class.new(raw_data.dig("data")) }

  describe "#raw_data" do
    it do
      expect(data.raw_data).to eq raw_data["data"]
    end
  end

  describe '#number_of_records' do
    it do
      expect(data.number_of_records).to eq raw_data["data"]["numberOfRecords"]
    end
  end

  describe '#number_of_return' do
    it do
      expect(data.number_of_return).to eq raw_data["data"]["numberOfReturn"]
    end
  end

  describe '#records' do
    it do
      expect(data.records).to be_a(Array)
      expect(data.records.first).to be_a(Kokkai::Record)
    end
  end
end