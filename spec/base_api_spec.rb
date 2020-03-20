# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::BaseAPI do
  class TestCollections < BestBuy::BaseAPI
    TEST_COLLECTIONS_API = '/v1/testCollections'

    def model
      TestCollection
    end

    def collection_name
      :test_collections
    end

    def api_url
      '/v1/testCollections'
    end
  end

  class TestCollection
    attr_reader :id, :active

    def initialize(init_params)
      @id = init_params[:id]
      @active = init_params[:active]
    end
  end

  describe '#get_all' do
    let(:api_key) { '111111' }

    let(:url) { BestBuy::BaseAPI::BASE_URL + TestCollections::TEST_COLLECTIONS_API }
    let(:search_query) { '' }
    let(:request_params) do
      {
        apiKey: api_key,
        format: 'json',
        show: 'all'
      }
    end
    let(:test_collection_id) { '222222' }
    let(:api_response) do
      JSON.generate(
        {
          from: 1,
          to: 10,
          currentPage: 1,
          total: 100,
          totalPages: 10,
          queryTime: '0.23',
          totalTime: '0.40',
          partial: false,
          canonicalUrl: '/v1/testCollections?format=json&apiKey=11111111',
          testCollections: [
            {
              id: test_collection_id,
              active: true
            }
          ]
        }
      )
    end

    subject(:test_collections_api) { TestCollections.new(api_key) }

    let(:stubbed_request) do
      stub_request(:get, url + search_query)
        .with(query: request_params)
        .to_return(body: api_response, status: 200)
    end

    before do
      stubbed_request
    end

    it 'creates a request to best buy to get all records' do
      test_collections_api.get_all

      expect(stubbed_request).to have_been_requested
    end

    it 'returns a TestCollection instance' do
      test_collections_response = test_collections_api.get_all

      expect(test_collections_response.collection.map(&:id)).to contain_exactly(test_collection_id)
    end

    context 'when a search query param is specified' do
      let(:search_query) { '(active=true)' }

      it 'hits the best buy api with that search query' do
        test_collections_api.get_all(search_query: search_query)

        expect(stubbed_request).to have_been_requested
      end
    end

    context 'when pagination params are specified' do
      context 'when page is specified' do
        let(:page) { 1 }
        let(:request_params) do
          {
            apiKey: api_key,
            format: 'json',
            show: 'all',
            page: page
          }
        end

        it 'hits the best buy api with that pagination param' do
          test_collections_api.get_all(pagination: { page: page })

          expect(stubbed_request).to have_been_requested
        end
      end

      context 'when page size is specified' do
        let(:page_size) { 1 }
        let(:request_params) do
          {
            apiKey: api_key,
            format: 'json',
            show: 'all',
            page_size: page_size
          }
        end

        it 'hits the best buy api with that pagination param' do
          test_collections_api.get_all(pagination: { page_size: page_size })

          expect(stubbed_request).to have_been_requested
        end
      end

      context 'when both page and page size are specified' do
        let(:page_size) { 1 }
        let(:page) { 1 }
        let(:request_params) do
          {
            apiKey: api_key,
            format: 'json',
            show: 'all',
            page_size: page_size,
            page: page
          }
        end

        it 'hits the best buy api with those pagination params' do
          test_collections_api.get_all(pagination: { page: page, page_size: page_size })

          expect(stubbed_request).to have_been_requested
        end
      end
    end
  end
end
