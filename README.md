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
has_many :pays


## items table

| Column          | Type          | Options                        |
|-----------------|---------------|--------------------------------|
| name            | string        | null: false                    |
| price           | integer       | null: false                    |
| description     | text          | null: false                    |
| category        | string        | null: false                    |
| status          | string        | null: false                    |
| delivery_charge | string        | null: false                    |
| shipping_area   | string        | null: false                    |
| days_to_ship    | string        | null: false                    |
| user            | references    | null: false, foreign_key: true |

## アソシエーション
has_many :user
has_one :pays


## pays table

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :user
has_one :items
has_one :sending

## sending table

| Column        | Type       | Options      |
|---------------|------------|--------------|
| postal_code   | string     | null: false  |
| prefectures   | string     | null: false  |
| municipality  | string     | null: false  |
| address       | string     | null: false  |
| building_name | string     |              |
| phone         | string     | null: false  |

has_one :pays