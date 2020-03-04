require './lib/best_buy_ruby/v1/models/base_category'

module BestBuyRuby
  module V1
    class Category < BaseCategory
      def initialize(id:, name:, url:, active:, path:, sub_categories: [])
        @url = url
        @active = active
        @path = path
        @sub_categories = sub_categories.map do |sub_category|
          BaseCategory.new(sub_category)
        end

        super(id: id, name: name)
      end

      attr_reader :url, :active, :path, :sub_categories
    end
  end
end
