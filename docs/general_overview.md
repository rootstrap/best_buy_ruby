# General Overview

The different APIs accessible by this gem are:

- [Products](products_api.md)
- [Stores](stores_api.md)
- [Categories](categories_api.md)

In spite of having each their own specification, they all share some basics listed here.

## API key usage

All APIs can be initialized by passing the API key in the `new` method

```ruby
BestBuy::Products.new(your_api_key)
```
But the key can also be set up in a `configure` method available for the `BestBuy` module:
```ruby
BestBuy.configure do |config|
  config.api_key = 'your_api_key'
end
```
Then, the next time you instantiate any API you can omit the key:

```ruby
BestBuy::Products.new
```
For Ruby on Rails projects you can run:

    $ rails generate best_buy:config
    
To generate this file: `config/initializers/best_buy.rb`, where you can write the configuration code.

For non Ruby on Rails projects, you can still write the configuration code wherever you like, as long as you make sure it runs before trying to access the APIs.
## Common interface

This method can be used with any of the APIs:

#### `get_all(search_query:, pagination:)`
_alias: `index`_

Retrieves a collection of items (these depend on the API). These items will be filtered by `search_query` and limited by `pagination`.

Params:

- `search_query`: A string representing the query added to the URL to filter the items (See [Search Techniques](https://bestbuyapis.github.io/api-documentation/#search-techniques) in the Best Buy API reference). Optional.
- `pagination`: See [Pagination](general_overview.md#pagination). Optional.

Returns: a [`CollectionsResponse`](general_overview.md#collections-response) object

```ruby
search_query = '(active=true)'
pagination_params = { page: 2, page_size: 20 }

BestBuy::Categories.new(your_api_key).get_all(search_query: search_query, pagination: pagination_params)
```

## Collections response

Every request made that returns a collection of items (no matter what *kind* of item) will return an object called `CollectionsResponse`. This object contains two attributes:

- `header`
- `collection`

The `collection` will contain a list of objects of the requested collection (`Product`, `Store`, etc).

The `header` will be a `CollectionHeader` object which will contain some metadata of the request itself. Its attributes include:

- `canonical_url`: the non-server part of the query
- `current_page`: the page being returned
- `partial`: flag indicating whether or not the query returned only partial results (in the event of a timeout)
- `from`: the index of the first item returned on the current page
- `to`: the index of the last item returned on the current page
- `total`: the total number of items returned by the query
- `total_pages`: the number of pages required to list all items
- `query_time`: the time required to search the database
- `total_time`: the time required to parse, search, format and return results

## Pagination

Best Buy APIs accept pagination parameters to control the amount of results returned. That's why for the `get_all` method, for example, there's an optional `pagination` parameter, which consists of a hash with two also optional keys:

- `:page`: number of the page of results you’d like returned
- `:page_size`: amount of results per page (default: 10, max: 100)

Example:
```ruby
pagination_params = { page: 3, page_size: 50 }

BestBuy::Stores.new(your_api_key).get_all(pagination: pagination_params)
```
