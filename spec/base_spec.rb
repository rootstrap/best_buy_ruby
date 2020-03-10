# frozen_string_literal: true

RSpec.describe BestBuy do
  it 'has a version number' do
    expect(BestBuy::Base::VERSION).not_to be nil
  end
end
