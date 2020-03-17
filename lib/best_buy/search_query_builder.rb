# frozen_string_literal: true

module BestBuy
  class SearchQueryBuilder
    def add(condition)
      conditions << condition
    end

    def build
      full_condition_string = conditions.inject do |condition_string, condition|
        condition_string + '&' + condition
      end

      return '' unless full_condition_string.present?

      '(' + full_condition_string + ')'
    end

    private

    def conditions
      @conditions ||= []
    end
  end
end
