require "kokkai/data"
require "kokkai/error"
module Kokkai
  class Parser
    attr_reader :raw_data, :data

    def initialize(raw_data, raw_status)
      if raw_status == 200
        @data = Data.new(raw_data.dig("data"))
      else
        error = error(raw_data, raw_status)
        raise(error)
      end
    end

    private

      def error(raw_data, raw_status)
        klass = Kokkai::Error::ERRORS[raw_status]
        klass.from_response(raw_data)
      end
  end
end
