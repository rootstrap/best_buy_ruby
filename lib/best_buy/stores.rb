# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Stores < BaseAPI
    STORES_API = '/v1/stores'

    protected

    def collection_type
      Store
    end

    def collection_name
      :stores
    end

    def api_url
      STORES_API
    end
  end
end
