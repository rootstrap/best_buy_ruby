# frozen_string_literal: true

module BestBuy
  module Conditions
    class RefurbishedCondition
      def initialize(condition_hash)
        @item_condition = condition_hash[:item_condition]&.downcase
      end

      def valid?
        @item_condition.present? && @item_condition == 'refurbished'
      end

      def search_query
        'condition=refurbished'
      end
    end
  end
end
