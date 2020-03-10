# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Categories
    CATEGORIES_API = '/categories'

    attr_reader :api_key, :format

    def initialize(api_key, format)
      @api_key = api_key
      @format = format
    end

    def get_all(page: nil, page_size: nil)
      request_params = {
        apiKey: api_key,
        format: format.to_s,
        page: page,
        page_size: page_size
      }.compact

      response = APIHelper.new.parse_response(get_categories(request_params))
      header = response.except(:categories)
      CollectionsResponse.new(
        header: header,
        collection: response[:categories],
        collection_type: Category
      )
    end
    alias_method :index, :get_all

    private

    def get_categories(params)
      connection.get(CATEGORIES_API, params).body
    end

    def connection
      @connection ||= Faraday.new(url: BaseAPI::BASE_URL)
    end
  end
end
