# frozen_string_literal: true

require 'best_buy'

module BestBuy
  class Stores < BaseAPI
    STORES_API = '/v1/stores'

    def find(store_id)
      response = get_response("/#{store_id}.json", { apiKey: api_key })
      parsed_response = APIHelper.new.parse_response(response)

      model_class.new(parsed_response)
    end

    protected

    def model_class
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
