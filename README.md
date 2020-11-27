# テーブル設計

## users テーブル

| Column   | Type   | Options             |
| -------- | ------ | -----------         |
| nickname | string | null: false         |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false|
| first_name| string | null: false        |
| last_name | string | null: false        |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday  | date | null: false          |

### Association

- has_many :item
- has_many :purchase


## item テーブル

| Column | Type   | Options                             |
| ------ | ------ | ------------------------------------|
| name   | string | null: false                         |
| text   | text | null: false                           |
| category_id | integer | null: false                   |
| status_id | integer | null: false                     |
| shipping_fee_id | integer | null: false                  |
| prefecture_id | integer  | null: false                |
| scheduled_delivery_id  | integer | null: false            |
| price  | integer | null: false                        |

### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true|

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code   | string | null: false                |
| prefecture_id   | integer | null: false             |
| city   | string | null: false                       |
| addresses  | string | null: false                   |
| building | string |                                 |
| phone_number   | string | null: false               |
| purchease  | references | null: false, foreign_key: true|

### Association

- belongs_to :purchase