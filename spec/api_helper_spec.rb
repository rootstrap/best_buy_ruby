# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::APIHelper do
  describe '#parse_response' do
    include_context 'categories'

    let(:parsed_response) { full_categories_response_hash }

    context 'json response' do
      let(:response) { full_categories_response_json }

      it 'parses it into a hash with symbol keys' do
        expect(subject.parse_response(response)).to eq(parsed_response)
      end
    end
  end
end
