# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false,unique: true |
| password           | string              | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| family_name_kana   | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_year         | string              | null: false              |
| birth_month        | string              | null: false              |
| birth_day          | string              | null: false              |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| image                               | string     | null: false       |
| product_name                        | string     | null: false       |
| text                                | text       | null: false       |
| category                            | string     | null: false       |
| product_condition                   | integer    | null: false       |
| shipping_charge                     | integer    | null: false       |
| shipping_area                       | integer    | null: false       |
| delivery_time                       | integer    | null: false       |
| price                               | string     | null: false       |

### Association

- belongs_to :users
- has_one :orders

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :items
- has_one :addresses

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| order              | references          | foreign_key: true       |
| postal_code        | string              | null: false             |
| prefecture         | string              | null: false             |
| city               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              | null: false             |
| telephone_number   | integer             | null: false             |

### Association

- belongs_to :orders