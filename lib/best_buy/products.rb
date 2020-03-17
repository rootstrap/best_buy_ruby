# frozen_string_literal: true

module BestBuy
  class Products < BaseAPI
    PRODUCTS_API = '/v1/products'

    def get_by(category_id: nil, min_price: nil, max_price: nil, pagination: {})
      search_query_builder.add("categoryPath.id=#{category_id}") if category_id.present?

      if min_price.present?
        search_query_builder.add(
          "((regularPrice>=#{min_price}&onSale=false)|(salePrice>=#{min_price}&onSale=true))"
        )
      end

      if max_price.present?
        search_query_builder.add(
          "((regularPrice<=#{max_price}&onSale=false)|(salePrice<=#{max_price}&onSale=true))"
        )
      end

      get_all(search_query: search_query_builder.build, pagination: pagination)
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

    def search_query_builder
      @search_query_builder ||= SearchQueryBuilder.new
    end
  end
end
