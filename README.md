# README
# テーブル設計

## usersテーブル

| Column              | Type    | Options     |
| ----------          | ------  | ----------  |
| nickname            | string  | NOT NULL    |
| email               | string  | NOT NULL    |
| password            | string  | NOT NULL    |
| family_name         | string  | NOT NULL    |
| first_name          | string  | NOT NULL    |
| family_name_kana    | string  | NOT NULL    |
| first_name_kana     | string  | NOT NULL    |
| birthday            | date    | NOT NULL    |

### Association

- has_many  :itmes
- has_one  :buyer

## itemsテーブル

| Column              | Type          | Options           |
| ----------          | ------        | ----------        |
| user_id             | references    | foreign_key: true |
| image               | ActiveStorage                     |
| item_name           | string        | NOT NULL          |
| item_description    | string        | NOT NULL          |
| item_category       | string        | NOT NULL          |
| item_status         | string        | NOT NULL          |
| delivery_charge     | string        | NOT NULL          |
| shipment_source     | string        | NOT NULL          |
| shipping_days       | string        | NOT NULL          |
| selling_price       | numeric       | NOT NULL          |
          
### Association

- belong_to  :user

## buyer
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| user_id             | references    | foreign_key: true |
| phone_number        | string        | NOT NULL          |

### Association

- belong_to  :user
- has_one  :adress

## address
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| buyer_id            | references    | foreign_key: true |
| postal_code         | string        | NOT NULL          |
| prefecture          | string        | NOT NULL          |
| municipality        | string        | NOT NULL          |
| address             | string        | NOT NULL          |
| building_name       | string        | NOT NULL          |

### Association
- belong_to :buyer
