# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Categories < BaseAPI
    CATEGORIES_API = '/v1/categories'

    def get_all(pagination_params = {})
      request_params = {
        apiKey: api_key,
        format: format.to_s
      }.merge(pagination_params)

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
  end
end
