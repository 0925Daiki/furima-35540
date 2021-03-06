## users table

| Column             | Type     | Options                   |
|--------------------|----------|---------------------------|
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_ruby     | string   | null: false               |
| first_name_ruby    | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | date     | null: false               |

## アソシエーション
has_many :items
has_many :comments
has_many :orders


## items table

| Column             | Type          | Options                        |
|--------------------|---------------|--------------------------------|
| name               | string        | null: false                    |
| price              | integer       | null: false                    |
| description        | text          | null: false                    |
| category_id        | integer       | null: false                    |
| status_id          | integer       | null: false                    |
| delivery_charge_id | integer       | null: false                    |
| shipping_area_id   | integer       | null: false                    |
| days_to_ship_id    | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |

## アソシエーション
has_many :comments
belongs_to :user
has_one :order

## comments table
| Column | Type       | Options           |
|--------|------------|-------------------|
| text   | text       |                   |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

## アソシエーション
belongs_to :user
belongs_to :item

## orders table

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, | Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| city             | string     | null: false                    | |

## アソシエーション
belongs_to :user
belongs_to :item
has_one :send

## addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| phone            | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

belongs_to :order