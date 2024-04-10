# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| name_kana          | string | null: false |
| birthday           |integer | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :shipping_addresses


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user    　　　　    |references| null: false, foreign_key: true |
| image              | text   | null: false |
| itemname           | string | null: false |
| discription        | text   | null: false |
| price              | integer| null: false |


### Association

- has_one :purchase
- belongs_to :user
- has_many :shipping_addresses



## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user          　　  |references| null: false, foreign_key: true |
| item         　　   |references| null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_adress

## shipping_addressesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase           |references|null: false|
| credit_card_number | integer| null: false |
| expiration_date    | integer| null: false |
| security_code      | integer| null: false |
| postal_code        | integer| null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string |
| phone_number       | integer| null: false |



### Association

- belongs_to :purchase

