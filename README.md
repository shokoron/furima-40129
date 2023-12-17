# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| description        | text    | null: false                    |
| category           | integer | null: false                    |
| condition          | integer | null: false                    |
| shipping_charge    | integer | null: false                    |
| shipping_area      | integer | null: false                    |
| shipping_days      | integer | null: false                    |
| price              | integer | null: false                    |
| user               | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- has_one :address


## orders テーブル

| Column             | Type    | Options                        |
| ------------------ | ------  | ------------------------------ |
| user               | integer | null: false, foreign_key: true |
| item               | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column             | Type    | Options                        |
| ------------------ | ------  | ------------------------------ |
| postal_code        | string  | null: false                    |
| prefecture         | integer | null: false                    |
| city               | string  | null: false                    |
| street_address     | string  | null: false                    |
| building_name      | string  | null: false                    |
| phone_number       | string  | null: false                    |
| order              | integer | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :order