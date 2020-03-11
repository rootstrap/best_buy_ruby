# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  class Category < BaseCategory
    attr_reader :url, :active, :path, :sub_categories

    def initialize(init_params)
      @url            = init_params[:url]
      @active         = init_params[:active]
      @path           = init_params[:path]
      @sub_categories = init_params[:sub_categories].map do |sub_category|
        BaseCategory.new(sub_category)
      end

      super(init_params)
    end
  end
end
