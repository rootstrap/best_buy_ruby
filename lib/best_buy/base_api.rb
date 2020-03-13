# frozen_string_literal: true

module BestBuy
  class BaseAPI
    BASE_URL = 'https://api.bestbuy.com'

    attr_reader :api_key, :format

    def initialize(api_key, format)
      @api_key = api_key
      @format = format
    end

    protected

    def connection
      @connection ||= Faraday.new(url: BaseAPI::BASE_URL)
    end
  end
end
