require 'kokkai/utils/string_formatter.rb'
require 'pry'
module Kokkai
  class Record
    using Utils::StringFormatter

    attr_reader :raw, :raw_record

    DEFAULT_ATTRIBUTES = %i(session number_of_house name_of_meeting issue date meeting_url pdf_url).freeze

    class << self
      def define_attribute_methods(attrs)
        attrs.each do |attr|
          define_method(attr) do
            @raw_record ? @raw_record[attr.to_s.to_camel] : nil
          end
        end
      end
    end

    define_attribute_methods(DEFAULT_ATTRIBUTES)

    def initialize(raw)
      @raw = raw
      @raw_record = @raw.dig("recordData")
    end
  end
end