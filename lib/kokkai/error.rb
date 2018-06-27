module Kokkai
  class Error < StandardError
    attr_reader :code

    ClientError = Class.new(self)
    BadRequest = Class.new(ClientError)

    ERRORS = {
      400 => Kokkai::Error::BadRequest
    }.freeze

    ATTRIBUTES = %w(data diagnostics diagnostic)

    class << self
      def from_response(body)
        message, code = parse_error(body)
        new(message, code)
      end

      private

        def parse_error(body)
          if body.nil?  || body.empty?
            ['', nil]
          elsif body.dig("data", "diagnostics")
            extract_message_from_error(body.dig(*ATTRIBUTES))
          end
        end

        def extract_message_from_error(body)
          message = body.dig("details").nil? ? body.dig("message") : body.dig("details")
          message = message.first if message.is_a?(Array)
          match = message.match(/\([0-9]{5}\)/)
          [match.post_match, match[0].gsub(/\(|\)/, '').to_i]
        end

    end

    def initialize(message, code)
      super(message)
      @code = code
    end
  end
end