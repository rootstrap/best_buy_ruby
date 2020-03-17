# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::SearchQueryBuilder do
  subject(:builder) { described_class.new }

  describe '#add' do
    let(:condition) { 'active=true' }

    it 'stores the condition' do
      builder.add(condition)

      expect(builder.send(:conditions)).to contain_exactly condition
    end
  end

  describe '#build' do
    context 'when there are no conditions' do
      it 'returns an empty string' do
        expect(builder.build).to eq ''
      end
    end

    context 'when there is a single condition' do
      let(:condition) { 'active=true' }

      before { builder.add(condition) }

      it 'returns the condition surrounded by ()' do
        expect(builder.build).to eq '(' + condition + ')'
      end

      context 'when there are more conditions' do
        let(:other_condition) { 'onSale=true' }

        before { builder.add(other_condition) }

        it 'returns the conditions joined by & and surrounded by ()' do
          expect(builder.build).to eq '(' + condition + '&' + other_condition + ')'
        end
      end
    end
  end
end
