require './lib/best_buy_ruby/v1/models/collection_header'

module BestBuyRuby
  module V1
    class CollectionsResponse
      def initialize(header:, collection:, collection_type:)
        @header = CollectionHeader.new(header)
        @collection = collection.map do |collection_item|
          collection_type.new(collection_item)
        end
      end

      attr_accessor :header, :collection
    end
  end
end