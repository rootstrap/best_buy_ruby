require './lib/best_buy'

module BestBuy
  class APIHelper
    def parse_response(response)
      JSON.parse(response).deep_transform_keys do |key|
        key.to_s.underscore.to_sym
      end
    end
  end
end
