# frozen_string_literal: true

module BestBuy
  class Products < BaseAPI
    PRODUCTS_API = '/v1/products'

    def get_by(category_id:, pagination: {})
      request_params = {
        apiKey: api_key,
        format: format.to_s
      }.merge(pagination)
      search_query = "(categoryPath.id=#{category_id})"

      response = APIHelper.new.parse_response(get_products(search_query, request_params))
      header = response.except(:products)
      CollectionsResponse.new(
        header: header,
        collection: response[:products],
        collection_type: Product
      )
    end

    private

    def get_products(search_query, params)
      connection.get(PRODUCTS_API + search_query, params).body
    end
  end
end
