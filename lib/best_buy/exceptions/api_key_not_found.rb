# frozen_string_literal: true

module BestBuy
  module Exceptions
    class ApiKeyNotFound < StandardError
      def message
        'No API key configured. Either configure it in config/initializers/best_buy.rb '\
          'or pass it as a parameter when creating the API instance.'
      end
    end
  end
end
