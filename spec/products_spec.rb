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

    let(:stubbed_request) do
      stub_request(:get, url + search_query)
        .with(query: request_params)
        .to_return(body: full_products_response_json, status: 200)
    end

    before do
      stubbed_request
    end

    context 'when specifying a category' do
      let(:requested_category_id) { movies_tv_category_id }
      let(:search_query) { "(categoryPath.id=#{requested_category_id})" }

      it 'returns only the products of that category' do
        products_response = products_api.get_by(category_id: movies_tv_category_id)

        expect(products_response.collection.map(&:sku)).to contain_exactly(movie_sku)
      end
    end

    context 'when specifying a minimum price for the item' do
      let(:min_price) { 10 }

      let(:products) { [movie] }

      let(:regular_price_condition) { "(regularPrice>=#{min_price}&onSale=false)" }
      let(:sale_price_condition) { "(salePrice>=#{min_price}&onSale=true)" }
      let(:search_query) { "((#{regular_price_condition}|#{sale_price_condition}))" }

      it 'hits the Best Buy API with the correct search query' do
        products_api.get_by(min_price: min_price)

        expect(stubbed_request).to have_been_requested
      end

      it 'returns the products that have a higher price' do
        products_response = products_api.get_by(min_price: min_price)

        expect(products_response.collection.map(&:sku)).to contain_exactly(movie_sku)
      end
    end

    context 'when specifying a maximum price for the item' do
      let(:max_price) { 10 }

      let(:products) { [music_cd] }

      let(:regular_price_condition) { "(regularPrice<=#{max_price}&onSale=false)" }
      let(:sale_price_condition) { "(salePrice<=#{max_price}&onSale=true)" }
      let(:search_query) { "((#{regular_price_condition}|#{sale_price_condition}))" }

      it 'hits the Best Buy API with the correct search query' do
        products_api.get_by(max_price: max_price)

        expect(stubbed_request).to have_been_requested
      end

      it 'returns the products that have a higher price' do
        products_response = products_api.get_by(max_price: max_price)

        expect(products_response.collection.map(&:sku)).to contain_exactly(music_cd_sku)
      end
    end

    context 'when specifying the condition of the item' do
      context 'when the condition is new' do
        let(:item_condition) { 'new' }

        let(:products) { [movie] }

        let(:search_query) { "((condition=#{item_condition}|new=true))" }

        it 'hits the Best Buy API with the correct search query' do
          products_api.get_by(item_condition: item_condition)

          expect(stubbed_request).to have_been_requested
        end
      end

      context 'when the condition is pre-owned' do
        let(:item_condition) { 'pre-owned' }

        let(:products) { [music_cd] }

        let(:search_query) { "((condition=#{item_condition}|preowned=true))" }

        it 'hits the Best Buy API with the correct search query' do
          products_api.get_by(item_condition: item_condition)

          expect(stubbed_request).to have_been_requested
        end
      end

      context 'when the condition is refurbished' do
        let(:item_condition) { 'refurbished' }

        let(:products) { [] }

        let(:search_query) { "(condition=#{item_condition})" }

        it 'hits the Best Buy API with the correct search query' do
          products_api.get_by(item_condition: item_condition)

          expect(stubbed_request).to have_been_requested
        end
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
