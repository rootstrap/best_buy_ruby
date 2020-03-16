# frozen_string_literal: true

module BestBuy
  class CollectionHeader
    attr_reader :canonical_url, :current_page, :from, :partial,
                :query_time, :to, :total, :total_pages, :total_time

    def initialize(init_params)
      @canonical_url = init_params[:canonical_url]
      @current_page = init_params[:current_page]
      @from = init_params[:from]
      @partial = init_params[:partial]
      @query_time = init_params[:query_time]
      @to = init_params[:to]
      @total = init_params[:total]
      @total_pages = init_params[:total_pages]
      @total_time = init_params[:total_time]
    end
  end
end
