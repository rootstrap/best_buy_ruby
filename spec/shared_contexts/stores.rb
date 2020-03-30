# frozen_string_literal: true

RSpec.shared_context 'stores' do
  let(:full_stores_response_hash) do
    collection_header.merge(stores: stores)
  end

  let(:full_stores_response_json) do
    JSON.generate(
      full_stores_response_hash.deep_transform_keys { |key| key.to_s.camelcase(:lower) }
    )
  end

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
      canonical_url: '/v1/stores?format=json&apiKey=11111111'
    }
  end

  let(:stores) do
    [
      hato_rey_store,
      holyoke_mall_store
    ]
  end

  let(:hato_rey_store) do
    {
      store_Id: 1118,
      store_type: 'Big Box',
      location_type: 'Store',
      name: 'HATO REY PR',
      long_name: 'Hato Rey',
      address: '230 Calle Federico Costa',
      address2: 'Hato Rey',
      city: 'San Juan',
      region: 'PR',
      full_postal_code: '00918-1355',
      country: 'PR',
      lat: 18.42491,
      lng: -66.07171,
      gmt_offset: -4,
      services: [
        {
          service: 'Apple Shop'
        },
        {
          service: 'Geek Squad Services'
        },
        {
          service: 'Car and GPS Install Services'
        },
        {
          service: 'Marine Powered by Geek Squad'
        },
        {
          service: 'Microsoft Windows Store'
        },
        {
          service: 'Samsung Entertainment Experience'
        }
      ],
      phone: '787-764-4900',
      postal_code: '00918',
      detailed_hours: [
        {
          day: 'Sunday',
          date: '2020-03-15',
          open: 'Close',
          close: 'Close'
        },
        {
          day: 'Monday',
          date: '2020-03-16',
          open: 'Close',
          close: 'Close'
        },
        {
          day: 'Tuesday',
          date: '2020-03-17',
          open: '10:00',
          close: '18:00'
        }
      ]
    }
  end

  let(:holyoke_mall_store_name) { 'HOLYOKE MALL MA' }
  let(:holyoke_mall_store_id) { 418 }
  let(:holyoke_mall_store) do
    {
      store_id: holyoke_mall_store_id,
      store_type: 'Big Box',
      location_type: 'Store',
      name: holyoke_mall_store_name,
      long_name: 'Holyoke Mall',
      address: '50 Holyoke St',
      address2: '',
      city: 'Holyoke',
      region: 'MA',
      full_postal_code: '01040-2709',
      country: 'US',
      lat: 42.16931,
      lng: -72.64198,
      gmt_offset: -4,
      services: [
        {
          service: 'Amazon Alexa Experience'
        },
        {
          service: 'Apple Authorized Service Provider'
        },
        {
          service: 'Apple Shop'
        },
        {
          service: 'Geek Squad Services'
        },
        {
          service: 'Google Home Experience'
        }
      ],
      phone: '413-533-4443',
      postal_code: '01040',
      detailed_hours: [
        {
          day: 'Sunday',
          date: '2020-03-15',
          open: '10:00',
          close: '18:00'
        },
        {
          day: 'Monday',
          date: '2020-03-16',
          open: '10:00',
          close: '18:00'
        },
        {
          day: 'Tuesday',
          date: '2020-03-17',
          open: '10:00',
          close: '21:00'
        },
        {
          day: 'Wednesday',
          date: '2020-03-18',
          open: 'Close',
          close: 'Close'
        }
      ]
    }
  end
end
