module BestBuy
  class BaseCategory
    def initialize(id:, name:)
      @id = id
      @name = name
    end

    attr_reader :id, :name
  end
end
