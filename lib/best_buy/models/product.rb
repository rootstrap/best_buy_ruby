# frozen_string_literal: true

require './lib/best_buy'

module BestBuy
  # :reek:TooManyInstanceVariables
  class Product
    attr_reader :active, :alternate_categories, :category_path, :images, :name, :offers,
                :raw_attributes, :regular_price, :sale_price, :shipping_cost,
                :shipping_levels_of_service, :sku, :type, :upc, :url

    # rubocop:disable Metrics/AbcSize
    def initialize(init_params)
      @active                     = init_params[:active]
      @alternate_categories       = init_params[:alternate_categories]
      @category_path              = init_params[:category_path]
      @images                     = init_params[:images]&.map do |image_params|
        Image.new(image_params)
      end
      @name                       = init_params[:name]
      @offers                     = init_params[:offers]&.map do |offer_params|
        Offer.new(offer_params)
      end
      @regular_price              = init_params[:regular_price]
      @sale_price                 = init_params[:sale_price]
      @shipping_cost              = init_params[:shipping_cost]
      @shipping_levels_of_service = init_params[:shipping_levels_of_service]&.map do |slos_params|
        ShippingLevelOfService.new(slos_params)
      end
      @sku                        = init_params[:sku]
      @type                       = init_params[:type]
      @upc                        = init_params[:upc]
      @url                        = init_params[:url]

      @raw_attributes = init_params
    end
    # rubocop:enable Metrics/AbcSize
  end
end
