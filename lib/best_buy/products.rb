# frozen_string_literal: true

module BestBuy
  class Products < BaseAPI
    PRODUCTS_API = '/v1/products'

    def get_by(category_id:, pagination: {})
      search_query = "(categoryPath.id=#{category_id})"

      get_all(search_query: search_query, pagination: pagination)
    end

    protected

    def collection_type
      Product
    end

    def collection_name
      :products
    end

    def api_url
      PRODUCTS_API
    end
  end
end
