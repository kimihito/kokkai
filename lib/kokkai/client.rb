require 'kokkai/errors'
require 'kokkai/api_methods'
require 'kokkai/response'

module Kokkai
  class Client
    include ApiMethods

    def initialize
    end

    def send_get(path, params = nil)
      send_request(:get, path, params)
    end

    def send_request(method, path, params = nil)
      response = kokkai_connection.send(method, path, params)
      Kokkai::Response.new(response)
    end

    def kokkai_connection
      @kokkai_connection ||= Faraday.new(faraday_options) do |c|
        c.request  :url_encoded
        c.response :xml,  :content_type => /\bxml$/
        c.adapter Faraday.default_adapter
        c.options.params_encoder = ParamsEncoder
      end
    end

    private

    def faraday_options
      {
        url: faraday_url,
        headers: faraday_headers
      }
    end

    def default_headers
      {
        'Accept' => 'application/xml',
        'User-Agent' => "Kokkai Ruby Gem #{Kokkai::VERSION}"
      }
    end

    def faraday_headers
      default_headers
    end

    def faraday_url
      'http://kokkai.ndl.go.jp'
    end
  end

  class ParamsEncoder
    def self.encode(params)
      str = params.map {|(key, value)|
        "#{key}=#{value}"
      }.join('&')
      return ERB::Util.url_encode(str)
    end

    def self.to_query
    end
  end
end