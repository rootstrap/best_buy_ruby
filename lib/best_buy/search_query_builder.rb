# frozen_string_literal: true

module BestBuy
  class SearchQueryBuilder
    def add(condition)
      conditions << condition
    end

    def build
      return '' unless conditions.any?

      "(#{conditions.join('&')})"
    end

    private

    def conditions
      @conditions ||= []
    end
  end
end
