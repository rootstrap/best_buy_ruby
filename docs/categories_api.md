# Categories API

## The Category object

Attributes:

- `id`: Used to find all results within a specific category (e.g., 'abcat0100000')
- `name`: Used to find all subcategories (e.g., parents, siblings, children) within a specific category
- `url`: URL to corresponding BESTBUY.COM category page
- `active`: Indicates if the category is currently active or not
- `path`: Array of parent categories, starting with the root and finishing with the present one
- `sub_categories`: Array of child categories. Each one is a [BaseCategory](categories_api.md#the-basecategory-object) object

#### The BaseCategory object

A minimalistic version of a category. Used to represent the categories in occasions where not the whole information is available (like the categories returned as `sub_categories`)

Attributes:

- `id`: Used to find all results within a specific category (e.g., abcat0100000)
- `name`: Used to find all subcategories (e.g., parents, siblings, children) within a specific category

## Interface

(For more methods, check the [common API interface](general_overview.md#common-interface))
