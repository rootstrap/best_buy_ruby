# frozen_string_literal: true

require 'rspec'
require 'bundler/setup'
require 'simplecov'

require './lib/best_buy'
require './spec/shared_contexts/categories'
require './spec/shared_contexts/stubbed_requests'

SimpleCov.start do
  add_filter '/spec/'
end

require 'best_buy/base'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
