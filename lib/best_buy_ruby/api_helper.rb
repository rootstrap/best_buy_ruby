require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'

module BestBuyRuby
  class APIHelper
    def parse_response(response)
      JSON.parse(response).deep_transform_keys do |key|
        key.to_s.underscore.to_sym
      end
    end
  end
end
