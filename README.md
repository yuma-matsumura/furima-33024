# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false,unique: true |
| encrypted_password | string              | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| family_name_kana   | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birthday           | date                | null: false              |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| product_name                        | string     | null: false       |
| text                                | text       | null: false       |
| category_id                         | integer    | null: false       |
| product_condition_id                | integer    | null: false       |
| shipping_charge_id                  | integer    | null: false       |
| shipping_area_id                    | integer    | null: false       |
| delivery_time_id                    | integer    | null: false       |
| price                               | integer    | null: false       |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| order              | references          | foreign_key: true       |
| postal_code        | string              | null: false             |
| shipping_area_id   | integer             | null: false             |
| city               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              |                         |
| telephone_number   | string              | null: false             |

### Association

- belongs_to :order