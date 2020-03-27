# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::Stores do
  describe '#get_all' do
    include_context 'stores'

    subject(:stores_api) do
      described_class.new(api_key)
    end

    let(:api_key) { '11111111' }
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
end
