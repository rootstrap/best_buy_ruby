module BestBuyRuby
  module V1
    class CollectionHeader
      def initialize(from:, to:, current_page:, total:, total_pages:,
                     query_time:, total_time:, partial:, canonical_url:)
        @from = from
        @to = to
        @current_page = current_page
        @total = total
        @total_pages = total_pages
        @query_time = query_time
        @total_time = total_time
        @partial = partial
        @canonical_url = canonical_url
      end

      attr_reader :from, :to, :current_page, :total, :total_pages,
                    :query_time, :total_time, :partial, :canonical_url
    end
  end
end
