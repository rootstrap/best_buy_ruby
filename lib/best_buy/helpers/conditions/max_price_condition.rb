# frozen_string_literal: true

module BestBuy
  module Conditions
    class MaxPriceCondition
      def initialize(condition_hash)
        @max_price = condition_hash[:max_price]
      end

      def valid?
        @max_price.present?
      end

      def search_query
        "((regularPrice<=#{@max_price}&onSale=false)|(salePrice<=#{@max_price}&onSale=true))"
      end
    end
  end
end
