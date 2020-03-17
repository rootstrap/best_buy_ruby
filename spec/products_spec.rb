# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::Products do
  describe '#get_by' do
    include_context 'products'

    let(:url) { "#{BestBuy::BaseAPI::BASE_URL}#{BestBuy::Products::PRODUCTS_API}" }
    let(:search_query) { '' }
    let(:api_key) { '11111111' }
    let(:request_params) do
      {
        apiKey: api_key,
        format: 'json'
      }
    end

    let(:products) { [movie] }

    subject(:products_api) { described_class.new(api_key) }

    before do
      stub_request(:get, url + search_query)
        .with(query: request_params)
        .to_return(body: full_products_response_json, status: 200)
    end

    context 'when specifying a category' do
      let(:requested_category_id) { movies_tv_category_id }
      let(:search_query) { "(categoryPath.id=#{requested_category_id})" }

      it 'returns only the products of that category' do
        products_response = products_api.get_by(category_id: movies_tv_category_id)

        expect(products_response.collection.map(&:sku)).to contain_exactly(movie_sku)
      end
    end

    context 'when specifying page number and page size' do
      let(:page_size) { 1 }
      let(:page) { 2 }
      let(:request_params) do
        {
          apiKey: api_key,
          format: 'json',
          page_size: page_size,
          page: page
        }
      end
      let(:products) { [music_cd] }

      it 'returns only the products of that customized page' do
        pagination = { page: page, page_size: page_size }
        products_response = subject.get_by(
          pagination: pagination
        )

        expect(products_response.collection.map(&:sku)).to contain_exactly(music_cd_sku)
      end
    end
  end
end
