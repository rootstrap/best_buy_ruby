require './lib/best_buy_ruby'

module BestBuyRuby
  class CollectionsResponse
    def initialize(header:, collection:, collection_type:)
      @header = CollectionHeader.new(header)
      @collection = collection.map do |collection_item|
        collection_type.new(collection_item)
      end
    end

    attr_reader :header, :collection
  end
end
