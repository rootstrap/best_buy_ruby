# frozen_string_literal: true

module BestBuy
  # :reek:TooManyInstanceVariables
  # :reek:UncommunicativeVariableName
  class Address
    attr_reader :address, :address2, :city, :country, :full_postal_code, :gmt_offset,
                :lat, :lng, :postal_code, :region

    def initialize(init_params)
      @address = init_params[:address]
      @address2 = init_params[:address2]
      @city = init_params[:city]
      @country = init_params[:country]
      @full_postal_code = init_params[:full_postal_code]
      @gmt_offset = init_params[:gmt_offset]
      @lat = init_params[:lat]
      @lng = init_params[:lng]
      @postal_code = init_params[:postal_code]
      @region = init_params[:region]
    end
  end
end
