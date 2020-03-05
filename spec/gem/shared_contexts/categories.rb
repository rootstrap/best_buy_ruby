RSpec.shared_context 'categories' do
  let(:full_categories_response_hash) do
    collection_header.merge(categories: categories)
  end

  let(:full_categories_response_json) do
    JSON.generate(full_categories_response_hash.deep_transform_keys { |key| key.to_s.camelcase(:lower) })
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
      canonical_url: '/v1/categories?format=json&apiKey=11111111'
    }
  end

  let(:categories) do
    [
      gift_ideas_category,
      tvs_category
    ]
  end

  let(:gift_ideas_category_name) { 'Gift Ideas' }
  let(:gift_ideas_category) do
    {
      id: 'abcat0010000',
      name: gift_ideas_category_name,
      active: true,
      url: 'https://www.bestbuy.com/site/electronics/gift-ideas/abcat0010000.c?id=abcat0010000&cmp=RMX-cat',
      path: [
        {
          id: 'cat00000',
          name: 'Best Buy'
        },
        {
          id: 'abcat0010000',
          name: gift_ideas_category_name
        }
      ],
      sub_categories: [
        {
          id: 'pcmcat1496256957402',
          name: 'Top Tech Gifts'
        },
        {
          id: 'pcmcat748301108075',
          name: 'Stocking Stuffers'
        },
        {
          id: 'pcmcat1487279818011',
          name: "Mother's Day Gift Ideas"
        }
      ]
    }
  end

  let(:tvs_category_name) { 'TV & Home Theater' }
  let(:tvs_category) do
    {
      id: 'abcat0100000',
      name: tvs_category_name,
      active: true,
      url: 'https://www.bestbuy.com/site/electronics/tv-home-theater/abcat0100000.c?id=abcat0100000&cmp=RMX-cat',
      path: [
        {
          id: 'cat00000',
          name: 'Best Buy'
        },
        {
          id: 'abcat0100000',
          name: tvs_category_name
        }
      ],
      sub_categories: [
        {
          id: 'abcat0101000',
          name: 'TVs'
        },
        {
          id: 'abcat0103000',
          name: 'Smart TVs & Devices'
        },
        {
          id: 'pcmcat158900050008',
          name: 'Projectors & Screens'
        }
      ]
    }
  end
end
