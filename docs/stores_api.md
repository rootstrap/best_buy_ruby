# Stores API

## The Store object

Attributes:

- `location_type`: Whether the location is a Store or a Warehouse
- `long_name`: Full store name
- `name`: Store name
- `opening_time`: See [opening_time](stores_api.md#opening_time)
- `phone`: Store phone number; phone number for Express stores goes to Best Buy Customer Service
- `services`: Collection of services offered at each Best Buy store
- `store_id`: Store number
- `store_type`: Indicates the type of store, and is only present if locationType is ‘Store’. See the [official documentation](https://bestbuyapis.github.io/api-documentation/#common-attributes56) for more details
- `store_address`: See [The Address object](stores_api.md#the-address-object)

#### `opening_time`

Array of hashes containing info about the opening hours for each day for the next two weeks. It has the following keys:

- `:day`: Name of the day of the week (e.g.: 'Sunday')
- `:date`: Date of the day (YYYY-MM-DD)
- `:open`: Opening time (24-hour clock) (`'Close'` if the store is closed)
- `:close`: Closing time (24-hour clock) (`'Close'` if the store is closed)

#### The Address object

Object that keeps all the address information of the store.

Attributes:

- `address`: Street address
- `address2`: Street address 2 provides additional street address information for the Best Buy store in the result set
- `city`: City name
- `region`: State, territory
- `country`: Country name
- `postal_code`: 5-digit postal code
- `full_postal_code`: 9-digit postal code if available for store location
- `gmt_offset`: Time difference from GMT
- `lat`: Latitude
- `lng`: Longitude

Note: All these attributes are accessible directly by the Store object

```ruby
store = Store.new({ address: '50 Holyoke St' })
store.address # returns '50 Holyoke St'
```

## Methods

(For more methods, check the [common API methods](general_overview.md#common-methods))

#### `find(store_id)`

Returns the store matching the requested ID.

Params:

- `store_id`: The ID of the required store

Returns: a `Store` object

```ruby
store_id = 418

BestBuy::Stores.new(your_api_key).find(store_id)
```
