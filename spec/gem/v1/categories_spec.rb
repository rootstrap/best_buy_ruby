require 'rspec'
require './lib/best_buy_ruby/v1/categories'
require './lib/best_buy_ruby/v1/models/category'
require './lib/best_buy_ruby/v1/models/collections_response'
require './lib/best_buy_ruby/v1/models/collection_header'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'active_support/core_ext/array'

RSpec.describe BestBuyRuby::V1::Categories do
  let(:api_key) { '11111111' }
  let(:format) { :json }

  subject(:categories_api) do
    described_class.new(api_key, format)
  end

  describe '#get_all' do
    let(:collection_header) do
      {
        from: 1,
        to: 10,
        current_page: 1,
        total: 100,
        total_pages: 10,
        query_time: '0.23',
        total_time: '0.40',
        partial: false,
        canonical_url: '/v1/categories?format=json&apiKey=11111111'
      }
    end

    let(:first_category_name) { 'Gift Ideas' }
    let(:first_category) do
      {
        id: 'abcat0010000',
        name: first_category_name,
        active: true,
        url: 'https://www.bestbuy.com/site/electronics/gift-ideas/abcat0010000.c?id=abcat0010000&cmp=RMX-cat',
        path: [
          {
            id: 'cat00000',
            name: 'Best Buy'
          },
          {
            id: 'abcat0010000',
            name: 'Gift Ideas'
          }
        ],
        sub_categories: [
          {
            id: 'pcmcat1496256957402',
            name: 'Top Tech Gifts'
          },
          {
            id: 'pcmcat748301108075',
            name: 'Stocking Stuffers'
          },
          {
            id: 'pcmcat1487279818011',
            name: "Mother's Day Gift Ideas"
          }
        ]
      }
    end

    let(:second_category_name) { 'TV & Home Theater' }
    let(:second_category) do
      {
        id: 'abcat0100000',
        name: second_category_name,
        active: true,
        url: 'https://www.bestbuy.com/site/electronics/tv-home-theater/abcat0100000.c?id=abcat0100000&cmp=RMX-cat',
        path: [
          {
            id: 'cat00000',
            name: 'Best Buy'
          },
          {
            id: 'abcat0100000',
            name: 'TV & Home Theater'
          }
        ],
        sub_categories: [
          {
            id: 'abcat0101000',
            name: 'TVs'
          },
          {
            id: 'abcat0103000',
            name: 'Smart TVs & Devices'
          },
          {
            id: 'pcmcat158900050008',
            name: 'Projectors & Screens'
          }
        ]
      }
    end

    let(:categories) do
      [
        first_category,
        second_category
      ]
    end

    let(:api_response) do
      hash_response = collection_header.merge(categories: categories)
      JSON.generate(hash_response.deep_transform_keys { |key| key.to_s.camelcase(:lower) })
    end

    let(:request_params) do
      {
        apiKey: api_key,
        format: format.to_s
      }
    end

    before do
      allow(RestClient)
        .to receive(:get)
        .with(BestBuyRuby::V1::Categories::API_URL, request_params)
        .and_return(api_response)
    end

    it 'returns all the categories' do
      all_categories_response = subject.get_all

      expect(all_categories_response.header).to be_present
      expect(all_categories_response.collection.first.name).to eq(first_category_name)
      expect(all_categories_response.collection.second.name).to eq(second_category_name)
    end

    context 'when specifying page size' do
      let(:page_size) { 1 }
      let(:request_params) do
        {
          apiKey: api_key,
          format: format.to_s,
          page_size: page_size
        }
      end
      let(:categories) { [first_category] }

      it 'returns as much categories as that page size' do
        expect(subject.get_all(page_size: page_size).collection.count).to eq page_size
      end
    end

    context 'when specifying page number' do
      let(:page_size) { 1 }
      let(:page) { 2 }
      let(:request_params) do
        {
          apiKey: api_key,
          format: format.to_s,
          page_size: page_size,
          page: page
        }
      end
      let(:categories) { [second_category] }

      it 'returns only the categories of that page' do
        categories_response = subject.get_all(page: page, page_size: page_size)

        expect(categories_response.collection.first.name).to eq second_category_name
      end
    end
  end
end
