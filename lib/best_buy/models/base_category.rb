# frozen_string_literal: true

module BestBuy
  class BaseCategory
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id
      @name = name
    end
  end
end
