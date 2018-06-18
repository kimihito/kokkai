require 'kokkai/record'
module Kokkai
  class Speech < Record

    SPEECH_ATTRIBUTES = %i(speech_order speaker speech)

    define_attribute_methods(SPEECH_ATTRIBUTES)

    def initialize(raw)
      super
      @raw_record = @raw_record.dig("speechRecord")
    end
  end
end