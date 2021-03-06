# frozen_string_literal: true

module BestBuy
  class BaseAPI
    # All subclasses must implement:
    # :model_class
    # :collection_name
    # :api_url

    BASE_URL = 'https://api.bestbuy.com'

    attr_reader :api_key

    def initialize(api_key = BestBuy.config.api_key)
      raise Exceptions::ApiKeyNotFound unless api_key

      @api_key = api_key
    end

    def get_all(search_query: '', pagination: {})
      request_params = {
        apiKey: api_key,
        format: 'json',
        show: 'all'
      }.merge(pagination)

      response = APIHelper.new.parse_response(get_response(search_query, request_params))

      CollectionsResponse.new(
        response: response,
        collection_name: collection_name,
        collection_type: model_class
      )
    end
    alias_method :index, :get_all

    protected

    def connection
      @connection ||= Faraday.new(url: BaseAPI::BASE_URL)
    end

    def get_response(search_query, params)
      url = URI.escape(api_url + search_query) # rubocop:disable Lint/UriEscapeUnescape
      connection.get(url, params).body
    end
  end
end
