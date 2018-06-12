module Kokkai
  class KokkaiError < StandardError; end
  class ServiceUnavailableError < KokkaiError; end
end