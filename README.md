# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name_kanji     | string  | null: false |
| first_name_kanji    | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category           | string     | null: false                     |
| status             | string     | null: false                     |
| postage            | string     | null: false                     |
| district           | string     | null: false                     |
| days               | string     | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## orders テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| card_number        | integer    | null: false                     |
| card_expiry_month  | integer    | null: false                     |
| card_expiry_year   | integer    | null: false                     |
| card_cvc           | integer    | null: false                     |
| postal_code        | integer    | null: false                     |
| prefecture         | string     | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item