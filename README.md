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
| buyer               | references    | foreign_key: true |
| name                | string        | null: false       |
| description         | text          | null: false       |   <!-- 商品説明 -->
| category_id         | integer       | null: false       |   <!-- カテゴリー：Activehash -->
| status_id           | integer       | null: false       |   <!-- 商品状況：Activehash -->
| delivery_charge_id  | integer       | null: false       |   <!-- 配送料の負担：Activehash -->
| prefecture_id       | integer       | null: false       |   <!-- 発送元の地域：Activehash -->
| shipping_days_id    | integer       | null: false       |   <!-- 発送までの日数：Activehash -->
| selling_price       | integer       | null: false       |   
          
### Association

- belong_to  :user
- has_one  :buyer

## buyers
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| user                | references    | foreign_key: true |
| item                | references    | foreign_key: true |

### Association

- belong_to  :user
- belong_to  :items
- has_one  :adress

## address
 Column               | Type          | Options           |
| ----------          | ------        | ----------        |
| buyer               | references    | foreign_key: true |
| postal_code         | string        | null: false       |  <!-- 郵便番号 -->
| prefecture_id       | integer       | null: false       |  <!-- 都道府県 -->
| municipality        | string        | null: false       |  <!-- 市区町村 -->
| address             | string        | null: false       |  <!-- 番地 -->
| building_name       | string        |                   |  <!-- 建物名 -->
| phone_number        | string        | null: false       |  <!-- 電話番号 -->

### Association
- belong_to :buyer

