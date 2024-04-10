# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false |
| username           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_id            | string | null: false |
| seller_id          | string | null: false, foreign_key: true |
| itemname           | string | null: false |
| price              | string | null: false |
| password           | string | null: false |
| discription        | string | null: false |

### Association

- has_many :purchases
- belongs_to :user



## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase_id        | string | null: false |
| buyer_id           | string | null: false, foreign_key: true |
| item_id            | string | null: false |
| payment_method     | string | null: false |


### Association

- belongs_to :item
- belongs_to :user

