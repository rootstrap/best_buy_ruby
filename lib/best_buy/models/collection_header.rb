# frozen_string_literal: true

module BestBuy
  class CollectionHeader
    attr_reader :canonical_url, :current_page, :from, :partial,
                :query_time, :to, :total, :total_pages, :total_time

    def initialize(canonical_url:, current_page:, from:, partial:,
                   query_time:, to:, total:, total_pages:, total_time:)
      @canonical_url = canonical_url
      @current_page = current_page
      @from = from
      @partial = partial
      @query_time = query_time
      @to = to
      @total = total
      @total_pages = total_pages
      @total_time = total_time
    end
  end
end
