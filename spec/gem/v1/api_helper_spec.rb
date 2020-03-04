require 'rspec'
require './lib/best_buy_ruby/v1/api_helper'

RSpec.describe BestBuyRuby::V1::APIHelper do
  describe '#parse_response' do
    let(:response) do
      JSON.generate(
        {
          from: 1,
          to: 10,
          currentPage: 1,
          total: 100,
          totalPages: 10,
          categories: [
            {
              id: 'cat00000',
              name: 'Best Buy',
              subCategories: [
                {
                  id: 'abcat0010000',
                  name: 'Gift Ideas',
                },
              ],
            },
            {
              id: 'abcat0010000',
              name: 'Gift Ideas',
              subCategories: [],
            },
          ],
        }
      )
    end

    let(:parsed_response) do
      {
        from: 1,
        to: 10,
        current_page: 1,
        total: 100,
        total_pages: 10,
        categories: [
          {
            id: 'cat00000',
            name: 'Best Buy',
            sub_categories: [
              {
                id: 'abcat0010000',
                name: 'Gift Ideas',
              },
            ],
          },
          {
            id: 'abcat0010000',
            name: 'Gift Ideas',
            sub_categories: [],
          },
        ],
      }
    end

    context 'json response' do
      it 'parses it into a hash with symbol keys' do
        expect(subject.parse_response(response)).to eq(parsed_response)
      end
    end
  end
end