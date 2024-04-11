# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| lastname_kanji     | string | null: false |
| firstname_kanji    | string | null: false |
| lastname_kana      | string | null: false |
| firstname_kana     | string | null: false |
| birthday           |  date  | null: false |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user    　　　　    |references| null: false, foreign_key: true |
| itemname           | string | null: false |
| discription        | text   | null: false |
| price              | integer| null: false |
| category_id        | integer| null: false |
| condition_id       | integer| null: false |
|shipping_fee_responsibility_id| integer| null: false |
| prefecture_id	　　　| integer| null: false |
|shipping_duration_id| integer| null: false |


### Association

- has_one :purchase
- belongs_to :user




## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user          　　  |references| null: false, foreign_key: true |
| item         　　   |references| null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_addressesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase           |references|null: false, foreign_key: true |
| postal_code        | string | null: false |
| prefecture_id      | integer| null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string |
| phone_number       | string | null: false |



### Association

- belongs_to :purchase

