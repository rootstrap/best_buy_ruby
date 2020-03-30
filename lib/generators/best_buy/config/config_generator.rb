# frozen_string_literal: true

module BestBuy
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_config_file
        copy_file 'config.rb', 'config/best_buy/config.rb'
      end
    end
  end
end
