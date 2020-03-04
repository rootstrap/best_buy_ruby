module BestBuyRuby
  module V1
    class BaseCategory
      def initialize(id:, name:)
        @id = id
        @name = name
      end

      attr_accessor :id, :name
    end

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

      attr_accessor :url, :active, :path, :sub_categories
    end
  end
end
