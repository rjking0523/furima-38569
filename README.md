# README

## usersテーブル

| Column              | Type     | Options                        |
| ------------------- | -------- | ------------------------------ |
| email               | string   | null: false   unique: true     |
| encrypted_password  | string   | null: false                    |
| nickname            | string   | null: false                    |
| first_name          | string   | null: false                    |
| last_name           | string   | null: false                    |
| first_name_kana     | string   | null: false                    |
| last_name_kana      | string   | null: false                    |
| birth_date          | date     | null: false                    |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false  foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| apartment     | integer    |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false  foreign_key: true |

### Association
- belongs_to :order
