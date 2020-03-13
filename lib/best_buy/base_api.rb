# frozen_string_literal: true

module BestBuy
  class BaseAPI
    BASE_URL = 'https://api.bestbuy.com'

    attr_reader :api_key, :format

    def initialize(api_key, format)
      @api_key = api_key
      @format = format
    end

    def get_all(search_query: '', pagination: {})
      request_params = {
        apiKey: api_key,
        format: format.to_s
      }.merge(pagination)

      response = APIHelper.new.parse_response(get_response(search_query, request_params))

      CollectionsResponse.new(
        response: response,
        collection_name: collection_name,
        collection_type: collection_type
      )
    end
    alias_method :index, :get_all

    protected

    def connection
      @connection ||= Faraday.new(url: BaseAPI::BASE_URL)
    end

    def get_response(search_query, params)
      connection.get(api_url + search_query, params).body
    end

    def collection_type
      raise 'subclass responsibility'
    end

    def collection_name
      raise 'subclass responsibility'
    end

    def api_url
      raise 'subclass responsibility'
    end
  end
end
