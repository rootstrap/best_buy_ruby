# frozen_string_literal: true

require 'best_buy'

module BestBuy
  class Store
    attr_reader :location_type, :long_name, :name, :opening_time, :phone,
                :services, :store_id, :store_type, :store_address

    delegate :address, :address2, :city, :country, :full_postal_code, :gmt_offset,
             :lat, :lng, :postal_code, :region, to: :store_address

    def initialize(init_params)
      @location_type = init_params[:location_type]
      @long_name = init_params[:long_name]
      @name = init_params[:name]
      @opening_time = init_params[:detailed_hours]
      @phone = init_params[:phone]
      @services = init_params[:services]&.map { |service_hash| service_hash[:service] }
      @store_id = init_params[:store_id]
      @store_type = init_params[:store_type]

      @store_address = Address.new(init_params)
    end
  end
end
