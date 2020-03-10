# frozen_string_literal: true

RSpec.shared_context 'stubbed_requests' do
  let(:stubbed_connection) do
    Faraday.new do |builder|
      builder.adapter(:test, stubbed_requests)
    end
  end

  let(:stubbed_requests) { Faraday::Adapter::Test::Stubs.new }

  def stub_connection_for(api)
    allow(api).to receive(:connection).and_return(stubbed_connection)
  end

  def stub_get_request(url, status_code, body)
    stubbed_requests.get(url) do |_env|
      [
        status_code,
        { 'Content-Type': 'application/json' },
        body
      ]
    end
  end
end