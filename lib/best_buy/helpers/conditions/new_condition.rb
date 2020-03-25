# frozen_string_literal: true

module BestBuy
  module Conditions
    class NewCondition
      def initialize(condition_hash)
        @item_condition = condition_hash[:item_condition]&.downcase
      end

      def valid?
        @item_condition.present? && @item_condition == 'new'
      end

      def search_query
        '(condition=new|new=true)'
      end
    end
  end
end
