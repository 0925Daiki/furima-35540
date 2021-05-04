## users table

| Column    | Type     | Options     |
|-----------|----------|-------------|
| name      | string   | null: false |
| name-ruby | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |
| nickname  | string   | null: false |
| birthday  | datetime | null: false |

## アソシエーション
has_many :items
has_many :user_items
has_many :pays


## items table

| Column          | Type          | Options                        |
|-----------------|---------------|--------------------------------|
| name            | string        | null: false                    |
| price           | integer       | null: false                    |
| image           | ActiveStorage | null: false                    |
| description     | text          | null: false                    |
| category        | string        | null: false                    |
| status          | string        | null: false                    |
| delivery-charge | string        | null: false                    |
| shipping-area   | string        | null: false                    |
| user            | references    | null: false, foreign_key: true |

## アソシエーション
has_many :user
has_many :user_items
has_one :pays

## user_items table

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

## アソシエーション
 belongs_to :user
 belongs_to :items

## pays table

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :user
has_one :items
has_one :sending

## sending table

| Column        | Type       | Options      |
|---------------|------------|--------------|
| postal-code   | integer    | null: false  |
| prefectures   | string     | null: false  |
| municipality  | string     | null: false  |
| address       | integer    | null: false  |
| building-name | string     | null: false  |
| phone         | integer    | null: false  |

has_one :pays