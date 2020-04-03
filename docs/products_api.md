# Products API

## The Product object

Attributes:

- `active`: Identifies if product is currently supported in the BESTBUY.COM catalog
- `category_path`: A hierarchal view of a product returned as a collection
- `alternate_categories`: Alternative categories of the product
- `images`: An array of [Images](products_api.md#the-image-object)
- `name`: Product name
- `offers`: An array of [Offers](products_api.md#the-offer-object)
- `regular_price`: Product’s regular selling price
- `sale_price`: Current item selling price
- `shipping_cost`: Provides product’s lowest shipping costs
- `shipping_levels_of_service`: An array of [Shipping levels of service](products_api.md#the-shippinglevelofservice-object)
- `sku`: Best Buy unique 7-digit product identifier
- `type`: Best Buy product type. See [Product type details](https://bestbuyapis.github.io/api-documentation/#listing-products) in the Best Buy API reference for further information
- `upc`: Universal Product Code (UPC)
- `url`: URL to BESTBUY.COM product detail page
- `raw_attributes`: Hash containing all information returned by the Best Buy API about the product. Any attribute returned not present in the object can be found here.

#### The Image object

Attributes:

- `height`: Height of the image
- `width`: Width of the image
- `unit_of_measure`: Unit in which height and width are expressed
- `href`: URL of the image
- `primary`: If it's the main image or not
- `rel`: Name of the image
      
#### The Offer object

Attributes:

- `id`: Offer identifier
- `offer_name`: Offer name
- `content_notes`: Notes about the offer
- `start_date`: Offer start date
- `end_date`: Offer end date
- `text`: Offer description
- `type`: Offer types can include: special_offer, digital_insert and deal_of_the_day (See the [oficial documentation](https://bestbuyapis.github.io/api-documentation/#offers-and-deals) for further info)
- `url`: URL of offer information on BESTBUY.COM

#### The ShippingLevelOfService object

Represents the shipping options of the product, with their own prices.

Attributes:

- `service_level_id`: ID of the shipping level of service
- `service_level_name`: Name of the shipping level of service
- `unit_shipping_price`: Price of the shipping level of service

## Methods

(For more methods, check the [common API methods](general_overview.md#common-methods))

#### `get_by(conditions)`

Params:

- `conditions`: A hash including certain search conditions. All of them are optional.

    - `:category_id`: The ID of a category. Returns only products of that category.
    - `:min_price`: Minimum price allowed for the returned products. It will take into account products on sale.
    - `:max_price`: Maximum price allowed for the returned products. It will take into account products on sale.
    - `:item_condition`: The condition all returned products must have. Can be either `new`, `pre-owned` or `refurbished`.
    - `:pagination`: See [Pagination](general_overview.md#pagination)

Returns: a [`CollectionsResponse`](general_overview.md#collections-response) object

```ruby
conditions = {
    category_id: 'cat02015',
    min_price: 10,
    max_price: 15,
    item_condition: 'new',
    pagination: { page: 4, page_size: 100 }
}

BestBuy::Products.new(your_api_key).get_by(conditions)
```