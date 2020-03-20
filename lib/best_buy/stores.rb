# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Stores < BaseAPI
    STORES_API = '/v1/stores'

    def find(store_id)
      response = get_response("/#{store_id}.json", { apiKey: api_key })
      parsed_response = APIHelper.new.parse_response(response)

      model.new(parsed_response)
    end

    protected

    def model
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
