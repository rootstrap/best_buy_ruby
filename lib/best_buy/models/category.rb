# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Category < BaseCategory
    attr_reader :url, :active, :path, :sub_categories

    def initialize(id:, name:, url:, active:, path:, sub_categories: [])
      @url = url
      @active = active
      @path = path
      @sub_categories = sub_categories.map do |sub_category|
        BaseCategory.new(sub_category)
      end

      super(id: id, name: name)
    end
  end
end
