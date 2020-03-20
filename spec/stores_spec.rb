# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::Stores do
  include_context 'stores'

  let(:api_key) { '11111111' }

  subject(:stores_api) do
    described_class.new(api_key)
  end

  describe '#get_all' do
    let(:url) { "#{BestBuy::BaseAPI::BASE_URL}#{BestBuy::Stores::STORES_API}" }
    let(:page_size) { 1 }
    let(:page) { 2 }
    let(:request_params) do
      {
        apiKey: api_key,
        format: 'json',
        show: 'all',
        page_size: page_size,
        page: page
      }
    end
    let(:stores) { [holyoke_mall_store] }

    before do
      stub_request(:get, url)
        .with(query: request_params)
        .to_return(body: full_stores_response_json, status: 200)
    end

    it 'returns the stores of that page' do
      stores_response = subject.get_all(pagination: { page: page, page_size: page_size })

      expect(stores_response.collection.first.name).to eq holyoke_mall_store_name
    end
  end

  describe '#find' do
    let(:url) do
      "#{BestBuy::BaseAPI::BASE_URL}#{BestBuy::Stores::STORES_API}/#{holyoke_mall_store_id}.json"
    end
    let(:request_params) do
      {
        apiKey: api_key
      }
    end
    let(:holyoke_mall_store_json) do
      JSON.generate(
        holyoke_mall_store.deep_transform_keys { |key| key.to_s.camelcase(:lower) }
      )
    end
    let(:stubbed_request) do
      stub_request(:get, url)
        .with(query: request_params)
        .to_return(body: holyoke_mall_store_json, status: 200)
    end

    before do
      stubbed_request
    end

    it 'creates a request to best buy to get the store' do
      stores_api.find(holyoke_mall_store_id)

      expect(stubbed_request).to have_been_requested
    end

    it 'returns a Store instance' do
      expect(stores_api.find(holyoke_mall_store_id).name).to eq holyoke_mall_store_name
    end
  end
end
