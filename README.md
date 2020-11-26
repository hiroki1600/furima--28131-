# テーブル設計

## users テーブル

| Column   | Type   | Options             |
| -------- | ------ | -----------         |
| nickname | string | null: false         |
| email     | string | null: false         |
| password | string | null: false         |
| first_name| string | null: false        |
| last_name | string | null: false        |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday  | date | null: false          |

### Association

- has_many :product


## item テーブル

| Column | Type   | Options                             |
| ------ | ------ | ------------------------------------|
| name   | string | null: false                         |
| text   | text | null: false                         |
| category_id | integer | null: false                       |
| status | string | null: false                         |
| price  | integer | null: false                         |

### Association

- has_one :purchse
- belongs_to :user

## purchase テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| postal_code   | string | null: false                |
| prefecture_id   | integer | null: false             |
| city   | string | null: false                       |
| building | string | null: false                     |
| phone_number   | string | null: false               |
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true|

### Association

- belongs_to :product
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| shipping_fee | integer | null: false                   |
| prefecture_id | integer  | null: false                    |
| scheduled_delivery  | string | null: false           |

### Association

- belongs_to :purchse