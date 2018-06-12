require "spec_helper"

RSpec.describe Kokkai::Client  do
  subject(:client) { described_class.new() }
  describe "#speech", vcr: true do
    it "returns speeches" do
      params = {any: "アベノミクス", speaker: "安倍晋三", startRecord: 1, maximumRecords: 5}
      expect(client.speech(params).body).to eq "hoge"
    end
  end
end
