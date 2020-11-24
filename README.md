# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :product


## product テーブル

| Column | Type   | Options                             |
| ------ | ------ | ------------------------------------|
| name   | string | null: false                         |
| image  | string | null: false                         |
| coment | string | null: false                         |
| detale | string | null: false                         |
| date of shipment| string | null: false                |
| price  | string | null: false                         |

### Association

- has_one :purchse
- belongs_to :user

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| record  | string    | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true|

### Association

- belongs_to :product
- has_one :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name | string     |                                |
| purchse | references | null: false, foreign_key: true |

### Association

- belongs_to :purchse