# frozen_string_literal: true

module BestBuy
  class Products < BaseAPI
    include Conditions

    PRODUCTS_API = '/v1/products'
    CONDITIONS = [
      CategoryCondition,
      MinPriceCondition,
      MaxPriceCondition,
      NewCondition,
      PreOwnedCondition,
      RefurbishedCondition
    ].freeze

    def get_by(conditions)
      add_search_conditions_to_query(conditions.except(:pagination))

      pagination = conditions[:pagination] || {}

      get_all(search_query: search_query_builder.build, pagination: pagination)
    end

    protected

    def model_class
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

    def add_search_conditions_to_query(conditions)
      applying_conditions = CONDITIONS.map do |condition|
        condition.new(conditions)
      end.select(&:valid?)

      applying_conditions.each do |applying_condition|
        search_query_builder.add(applying_condition.search_query)
      end
    end
  end
end
