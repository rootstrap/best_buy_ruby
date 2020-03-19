# frozen_string_literal: true

module BestBuy
  module Conditions
    class ItemConditionCondition
      def initialize(condition_hash)
        @item_condition = condition_hash[:item_condition]
      end

      def valid?
        @item_condition.present?
      end

      # :reek:DuplicateMethodCall
      def search_query
        if @item_condition.downcase == 'new'
          '(condition=new|new=true)'
        elsif @item_condition.downcase == 'pre-owned'
          '(condition=pre-owned|preowned=true)'
        else
          "condition=#{@item_condition}"
        end
      end
    end
  end
end
