require "spec_helper"

RSpec.describe Kokkai::Client  do
  subject(:client) { described_class.new() }
  describe "#speech", vcr: true do
    it "returns speeches" do
      params = {any: "アベノミクス", speaker: "安倍晋三", startRecord: 1, maximumRecords: 5}
      expect(client.speech(params).body).to be_a(Kokkai::Parser)
    end
  end

  describe "#meeting", vcr: true do
    it "returns meetings" do
      params = { nameOfHouse: "両院", nameOfMeeting: "国家基本政策委員会合同審査会" }
      expect(client.meeting(params).body).to be_a(Kokkai::Parser)
    end
  end
end
