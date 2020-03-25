# frozen_string_literal: true

module BestBuy
  module Conditions
    class PreOwnedCondition
      def initialize(condition_hash)
        @item_condition = condition_hash[:item_condition]&.downcase
      end

      def valid?
        @item_condition.present? && @item_condition == 'pre-owned'
      end

      def search_query
        '(condition=pre-owned|preowned=true)'
      end
    end
  end
end
