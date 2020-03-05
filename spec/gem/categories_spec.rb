require './spec/spec_helper'

RSpec.describe BestBuyRuby::Categories do
  include_context 'categories'

  let(:api_key) { '11111111' }
  let(:format) { :json }

  subject(:categories_api) do
    described_class.new(api_key, format)
  end

  describe '#get_all' do
    let(:api_response) { full_categories_response_json }

    let(:request_params) do
      {
        apiKey: api_key,
        format: format.to_s
      }
    end

    before do
      allow(RestClient)
        .to receive(:get)
        .with(BestBuyRuby::Categories::API_URL, request_params)
        .and_return(api_response)
    end

    it 'returns all the categories' do
      all_categories_response = subject.get_all

      expect(all_categories_response.header).to be_present
      expect(all_categories_response.collection.first.name).to eq(gift_ideas_category_name)
      expect(all_categories_response.collection.second.name).to eq(tvs_category_name)
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
      let(:categories) { [gift_ideas_category] }

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
      let(:categories) { [tvs_category] }

      it 'returns only the categories of that page' do
        categories_response = subject.get_all(page: page, page_size: page_size)

        expect(categories_response.collection.first.name).to eq tvs_category_name
      end
    end
  end
end
