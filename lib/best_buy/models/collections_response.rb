require './lib/best_buy'

module BestBuy
  class CollectionsResponse
    attr_reader :header, :collection

    def initialize(header:, collection:, collection_type:)
      @header = CollectionHeader.new(header)
      @collection = collection.map do |collection_item|
        collection_type.new(collection_item)
      end
    end
  end
end
