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


## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category           | integer    | null: false                     |
| condition          | integer    | null: false                     |
| postage            | integer    | null: false                     |
| prefecture         | integer    | null: false                     |
| days               | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- has_one :purchase
- has_one :image
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :district
- belongs_to_active_hash :days

## credit_cards テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| number             | integer    | null: false                     |
| expiry_month       | integer    | null: false                     |
| expiry_year        | integer    | null: false                     |
| cvc                | integer    | null: false                     |
| purchase           | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase

## destinations テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postal_code        | string     | null: false                     |
| prefecture         | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase

## images テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| image              | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- belongs_to :item

## purchases テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- has_one :credit_card
- has_one :destination
- belongs_to :user
- belongs_to :item

## categories テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- has_many :items

## conditions テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| condition          | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- has_many :items

## postages テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| postage            | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- has_many :items

## Prefectures テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| prefecture         | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- has_many :items
- has_many :destinations

## days テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| day                | string     | null: false                     |
| item               | references | null: false, foreign_key: true  |

### Association

- has_many :items