# frozen_string_literal: true

module BestBuy
  class << self
    def configure
      yield config
    end

    def reset_configuration
      @config = Config.new
    end

    def config
      @config ||= Config.new
    end
  end

  class Config
    attr_accessor :api_key
  end
end
