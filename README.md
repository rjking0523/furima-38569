# README

## usersテーブル

| Column              | Type     | Options                        |
| ------------------- | -------- | ------------------------------ |
| email               | string   | null: false                    |
| encrypted_password  | string   | null: false                    |
| nickname            | string   | null: false                    |
| first_name          | string   | null: false                    |
| last_name           | string   | null: false                    |
| first_name_kana     | string   | null: false                    |
| last_name_kana      | string   | null: false                    |
| birth_date          | datetime | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| delivery_area   | string     | null: false                    |
| delivery_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| apartment     | integer    |                                |
| phone_number  | integer    | null: false                    |
| item          | references | null: false  foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
