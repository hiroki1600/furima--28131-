# テーブル設計

## users テーブル

| Column   | Type   | Options             |
| -------- | ------ | -----------         |
| nickname | string | null: false         |
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
| text   | string | null: false                         |
| category | string | null: false                       |
| status | string | null: false                         |
| price  | string | null: false                         |

### Association

- has_one :purchse
- belongs_to :user

## purchase テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true|

### Association

- belongs_to :product
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| shipping_fee | string | null: false                   |
| prefecture | string  | null: false                    |
| scheduled-delivery  | string | null: false           |

### Association

- belongs_to :purchse