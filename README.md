# README
# テーブル設計

## usersテーブル

| Column              | Type    | Options                    |
| ----------          | ------  | ----------                 |
| nickname            | string  | null: false                |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
| family_name         | string  | null: false                |
| first_name          | string  | null: false                |
| family_name_kana    | string  | null: false                |
| first_name_kana     | string  | null: false                |
| birthday            | date    | null: false                |

### Association

- has_many  :itmes
- has_many  :buyers

## itemsテーブル

| Column              | Type          | Options           |
| ----------          | ------        | ----------        |
| user                | references    | foreign_key: true |
| name                | string        | null: false       |
| description         | string        | null: false       |
| category            | integer       | null: false       |
| status              | integer       | null: false       |
| delivery_charge     | integer       | null: false       |
| address             | integer       | null: false       |
| shipping_days       | integer       | null: false       |
| selling_price       | integer       | null: false       |
          
### Association

- belong_to  :user
- belong_to  :buyer

## buyers
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| user                | references    | foreign_key: true |
| item                | references    | foreign_key: true |

### Association

- belong_to  :user
- has_many  :item
- has_one  :adress

## address
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| buyer               | references    | foreign_key: true |
| postal_code         | string        | null: false       |
| prefecture          | string        | null: false       |
| municipality        | string        | null: false       |
| address             | integer       | null: false       |
| building_name       | string        |                   |
| phone_number        | string        | null: false       |

### Association
- belong_to :buyer
