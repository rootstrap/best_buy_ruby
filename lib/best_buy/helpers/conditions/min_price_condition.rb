# frozen_string_literal: true

module BestBuy
  module Conditions
    class MinPriceCondition
      def initialize(condition_hash)
        @min_price = condition_hash[:min_price]
      end

      def valid?
        @min_price.present?
      end

      def search_query
        "((regularPrice>=#{@min_price}&onSale=false)|(salePrice>=#{@min_price}&onSale=true))"
      end
    end
  end
end
