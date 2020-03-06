require './lib/best_buy'

module BestBuy
  class Categories
    API_URL = "#{BaseAPI::BASE_URL}/categories".freeze

    attr_reader :api_key, :format

    def initialize(api_key, format)
      @api_key = api_key
      @format = format
    end

    def get_all(page: nil, page_size: nil)
      request_params = {
        apiKey: api_key,
        format: format.to_s,
        page: page,
        page_size: page_size
      }.compact
      response = APIHelper.new.parse_response(RestClient.get(API_URL, request_params))
      header = response.except(:categories)
      CollectionsResponse.new(
        header: header,
        collection: response[:categories],
        collection_type: Category
      )
    end
  end
end
