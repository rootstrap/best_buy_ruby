# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BestBuy::Generators::ConfigGenerator, type: :generator do
  destination File.expand_path('tmp', __dir__)

  before do
    prepare_destination
  end

  it 'creates the config file' do
    run_generator

    expect(file('config/initializers/best_buy.rb')).to exist
  end
end
