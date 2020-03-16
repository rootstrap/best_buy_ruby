# frozen_string_literal: true

module BestBuy
  class Offer
    attr_reader :content_notes, :end_date, :id, :offer_name, :start_date, :text, :type, :url

    def initialize(init_params)
      @content_notes = init_params[:content_notes]
      @end_date = init_params[:end_date]
      @id = init_params[:id]
      @offer_name = init_params[:offer_name]
      @start_date = init_params[:start_date]
      @text = init_params[:text]
      @type = init_params[:type]
      @url = init_params[:url]
    end
  end
end
