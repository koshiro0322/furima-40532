# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| username           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| regisration_date　  | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :shipping_addresses


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user    　　　　    | references | null: false, foreign_key: true |
| itemname           | string | null: false |
| discription        | text   | null: false |
| listing_date       | string | null: false |
| price              | integer| null: false |
| category           | integer| null: false |


### Association

- has_one :purchase
- belongs_to :user
- has_many :shipping_addresses



## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase_id        | integer| null: false |
| user_id            | integer| null: false, foreign_key: true |
| item_id            |integer | null: false, foreign_key: true |
| payment_method     | string | null: false |


### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_adress

## shipping_addressesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| shipping_address_id| integer| null: false, foreign_key: true |
| user_id            | integer| null: false, foreign_key: true |
| item_id            |integer | null: false, foreign_key: true |



### Association

- belongs_to :purchases

