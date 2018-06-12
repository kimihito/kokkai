require 'kokkai/utils/string_formatter.rb'
require 'kokkai/speech'
module Kokkai
  class Data
    using Utils::StringFormatter

    attr_reader :raw_data

    ATTRIBUTES = %i(number_of_records number_of_return start_record next_record_position records).freeze

    ATTRIBUTES.each do |attr|
      define_method(attr) do
        @raw_data ? @raw_data[attr.to_s.to_camel] : nil
      end
    end

    def initialize(raw_data)
      @raw_data = raw_data
    end

    def records
      @raw_data.dig("records", "record").map { |attrs| classify(attrs["recordData"].keys[0]).new(attrs) }
    end

    private

      def classify(name)
        Object.const_get("Kokkai::#{name.gsub(/Record$/, '').to_pascal}")
      end
  end
end