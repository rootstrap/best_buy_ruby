# frozen_string_literal: true

module BestBuy
  class ShippingLevelOfService
    attr_reader :service_level_id, :service_level_name, :unit_shipping_price

    def initialize(init_params)
      @service_level_id = init_params[:service_level_id]
      @service_level_name = init_params[:service_level_name]
      @unit_shipping_price = init_params[:unit_shipping_price]
    end
  end
end
