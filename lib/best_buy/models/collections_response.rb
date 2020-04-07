# frozen_string_literal: true

require 'best_buy'

module BestBuy
  class CollectionsResponse
    attr_reader :header, :collection

    def initialize(response:, collection_name:, collection_type:)
      header_hash = response.except(collection_name)
      collection_hash = response[collection_name]

      @header = CollectionHeader.new(header_hash)
      @collection = collection_hash.map do |collection_item|
        collection_type.new(collection_item)
      end
    end
  end
end
