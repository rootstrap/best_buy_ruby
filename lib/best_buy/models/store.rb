module BestBuy
  class Store
    attr_reader :address, :address2, :city, :country, :full_postal_code, :gmt_offset, :lat, :lng,
                :location_type, :long_name, :name, :opening_time, :phone, :postal_code, :region,
                :services, :store_id, :store_type

    def initialize(init_params)
      @address = init_params[:address]
      @address2 = init_params[:address2]
      @city = init_params[:city]
      @country = init_params[:country]
      @full_postal_code = init_params[:full_postal_code]
      @gmt_offset = init_params[:gmt_offset]
      @lat = init_params[:lat]
      @lng = init_params[:lng]
      @location_type = init_params[:location_type]
      @long_name = init_params[:long_name]
      @name = init_params[:name]
      @opening_time = init_params[:detailed_hours]
      @phone = init_params[:phone]
      @postal_code = init_params[:postal_code]
      @region = init_params[:region]
      @services = init_params[:services].map { |service_hash| service_hash[:service] }
      @store_id = init_params[:store_id]
      @store_type = init_params[:store_type]
    end
  end
end