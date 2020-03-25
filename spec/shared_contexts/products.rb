# frozen_string_literal: true

RSpec.shared_context 'products' do
  let(:full_products_response_hash) do
    collection_header.merge(products: products)
  end

  let(:full_products_response_json) do
    JSON.generate(
      full_products_response_hash.deep_transform_keys { |key| key.to_s.camelcase(:lower) }
    )
  end

  let(:products) do
    [
      movie,
      music_cd
    ]
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
      canonical_url: '/v1/products?format=json&apiKey=11111111'
    }
  end

  let(:movies_music_category_id) { 'abcat0600000' }
  let(:movies_tv_category_id) { 'cat02015' }

  let(:movie_sku) { 1_000_006 }
  let(:movie) do
    {
      name: 'Spy Kids: All the Time in the World [Includes Digital Copy] [Blu-ray] [2011]',
      sku: movie_sku,
      upc: '013132620237',
      regular_price: 12.99,
      sale_price: 10.99,
      on_sale: true,
      condition: 'new',
      shipping_cost: 3.99,
      shipping_levels_of_service: [
        {
          service_level_id: 5,
          service_level_name: 'One Day',
          unit_shipping_price: 16.25
        },
        {
          service_level_id: 3,
          service_level_name: 'Two Day',
          unit_shipping_price: 10.79
        },
        {
          service_level_id: 15,
          service_level_name: 'Standard',
          unit_shipping_price: 3.99
        }
      ],
      images: [
        {
          rel: 'Front_Original',
          unit_of_measure: 'pixels',
          width: '778',
          height: '1000',
          href: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/1000/1000006_so.jpg',
          primary: true
        },
        {
          rel: 'Front_Thumbnail',
          unit_of_measure: 'pixels',
          width: '54',
          height: '69',
          href: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/1000/1000006_s.gif',
          primary: false
        }
      ],
      url: 'https://api.bestbuy.com/click/-/1000006/pdp',
      categoryPath: [
        {
          id: 'cat00000',
          name: 'Best Buy'
        },
        {
          id: movies_music_category_id,
          name: 'Movies & Music'
        },
        {
          id: movies_tv_category_id,
          name: 'Movies & TV Shows'
        }
      ],
      alternateCategories: [
        {
          id: 'abcat0010000',
          name: 'Gift Ideas'
        }
      ],
      offers: [
        {
          id: '362785',
          text: 'Special bundle',
          url: 'https://api.bestbuy.com/click/-/1000006/pdp',
          type: 'gift_with_purchase',
          start_date: '2019-12-01T00:00:00.000-06:00',
          end_date: '2020-03-31T23:59:59.000-05:00',
          content_notes: 'buy a select product, get a limited bundle!',
          offer_name: 'Limited bundle with purchase of select product'
        }
      ],
      active: true,
      type: 'Movie'
    }
  end

  let(:music_cd_sku) { 10_385_941 }
  let(:music_cd) do
    {
      sku: music_cd_sku,
      name: 'Not Me',
      type: 'Music',
      active: true,
      regular_price: 9.99,
      sale_price: 6.99,
      on_sale: false,
      condition: 'preowned',
      url: 'https://api.bestbuy.com/click/-/10385941/pdp',
      upc: '051617440048',
      category_path: [
        {
          id: 'cat00000',
          name: 'Best Buy'
        },
        {
          id: movies_music_category_id,
          name: 'Movies & Music'
        },
        {
          id: 'cat02001',
          name: 'Music'
        }
      ],
      alternate_categories: [],
      shipping_cost: 3.99,
      shipping_levels_of_service: [],
      images: [
        {
          rel: 'Front_Detail',
          unit_of_measure: 'pixels',
          width: '54',
          height: '69',
          href: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/1038/10385941.jpg',
          primary: true
        },
        {
          rel: 'Front_Thumbnail',
          unit_of_measure: 'pixels',
          width: '54',
          height: '69',
          href: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/1038/10385941s.jpg',
          primary: false
        }
      ],
      offers: []
    }
  end
end
