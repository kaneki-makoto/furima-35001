# テーブル設計

##　usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false unique: true |
| email           | string | null: false              |
| password        | string | null: false              |
| kanji_last_name | string | null: false              |
| kanji_fist_name | string | null: false              |
| kana_last_name  | string | null: false              |
| kan_fist_name   | string | null: false              |
| birthday        | date   | null: false              |

### Association
- has_many :items
- has_many :purchase

##　itemsテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| product      | string     | null: false                   |
| explanation  | text       | null: false                   |
| category     | integer    | null: false                   |
| status       | integer    | null: false                   |
| burden       | integer    | null: false                   |
| area         | integer    | null: false                   |
| days         | integer    | null: false                   |
| price        | integer    | null: false                   |
| user_id      | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

##　purchaseテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| users_id | references | null: false foreign_key: true |
| items_id | references | null: false foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :purchase
- has_one :shipping

## shippingテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| prefectures   | string     | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| number        | string     | null: false                   |
| purchase_id   | references | null: false foreign_key: true |

### Association
- belongs_to :purchase
