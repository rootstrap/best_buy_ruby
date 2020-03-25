# frozen_string_literal: true

module BestBuy
  module Conditions
    class CategoryCondition
      def initialize(condition_hash)
        @category_id = condition_hash[:category_id]
      end

      def valid?
        @category_id.present?
      end

      def search_query
        "categoryPath.id=#{@category_id}"
      end
    end
  end
end
