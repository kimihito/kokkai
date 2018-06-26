require 'kokkai/record'
require 'kokkai/speech'

module Kokkai
  class Meeting < Record

    def initialize(raw)
      super
      @raw_record = @raw_record.dig("meetingRecord")
    end

    def speeches
      @raw_record.dig("speechRecord").map do |record|
        recordData = { "recordData" => { "speechRecord" => record } }
        Kokkai::Speech.new(recordData)
      end
    end
  end
end