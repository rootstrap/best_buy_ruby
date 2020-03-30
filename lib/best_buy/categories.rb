# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Categories < BaseAPI
    CATEGORIES_API = '/v1/categories'

    protected

    def model_class
      Category
    end

    def collection_name
      :categories
    end

    def api_url
      CATEGORIES_API
    end
  end
end
