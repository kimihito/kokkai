require 'memoist'
require 'kokkai/utils/string_formatter.rb'
module Kokkai
  class Record
    extend Memoist
    using Utils::StringFormatter

    attr_reader :raw, :raw_record

    DEFAULT_ATTRIBUTES = %i(session name_of_house name_of_meeting issue date meeting_url pdf_url).freeze

    class << self
      def define_attribute_methods(attrs)
        attrs.each do |attr|
          define_method(attr) do
            key = attr.to_s
            key = if key.match(/_url$/)
              key = key.split(/_url$/) { |s| s }.join() + ""
              key << "URL"
            else
              key.to_camel
            end
            @raw_record ? @raw_record[key] : nil
          end
          memoize attr
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