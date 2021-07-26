# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items, dependent: :destroy
- has_many :purchases, dependent: :destroy
- has_one :credit_card, dependent: :destroy

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
| user_id            | references | null: false, foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user

## credit_cards テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| number             | integer    | null: false                     |
| expiry_month       | integer    | null: false                     |
| expiry_year        | integer    | null: false                     |
| cvc                | integer    | null: false                     |
| user_id            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## deliveries テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | integer    | null: false                     |
| prefecture         | string     | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :image, dependent: :destroy

## images テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| image              | integer    | null: false                     |
| item_id            | references | null: false, foreign_key: true  |

### Association

- belongs_to :item

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user_id            | references | null: false, foreign_key: true  |
| item_id            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item