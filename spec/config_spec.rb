# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy do
  let(:api_key) { '111111' }

  def configure_api_key
    BestBuy.configure do |config|
      config.api_key = api_key
    end
  end

  describe '.configure' do
    it 'adds the configuration to the module' do
      configure_api_key

      expect(BestBuy.config.api_key).to eq api_key
    end
  end

  describe '.reset_configuration' do
    before do
      configure_api_key
    end

    it 'resets all the configuration of the module' do
      BestBuy.reset_configuration

      expect(BestBuy.config.api_key).not_to be_present
    end
  end
end
