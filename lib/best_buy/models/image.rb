# frozen_string_literal: true

module BestBuy
  class Image
    attr_reader :height, :href, :primary, :rel, :unit_of_measure, :width

    def initialize(init_params)
      @height = init_params[:height]
      @href = init_params[:href]
      @primary = init_params[:primary]
      @rel = init_params[:rel]
      @unit_of_measure = init_params[:unit_of_measure]
      @width = init_params[:width]
    end
  end
end
