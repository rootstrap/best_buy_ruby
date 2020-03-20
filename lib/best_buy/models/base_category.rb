# frozen_string_literal: true

module BestBuy
  class BaseCategory
    attr_reader :id, :name

    def initialize(init_params)
      @id = init_params[:id]
      @name = init_params[:name]
    end
  end
end
