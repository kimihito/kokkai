require "kokkai/data"
module Kokkai
  class Parser
    attr_reader :raw_data, :data

    def initialize(raw_data)
      @data = Data.new(raw_data.dig("data"))
    end
  end
end
