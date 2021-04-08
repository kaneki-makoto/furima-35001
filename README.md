# テーブル設計

##　usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false unique: true |
| email              | string | null: false unique: true |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| kanji_last_name    | string | null: false              |
| kanji_fist_name    | string | null: false              |
| kana_last_name     | string | null: false              |
| kan_fist_name      | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :purchases

##　itemsテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| product     | string     | null: false                   |
| explanation | text       | null: false                   |
| category_id | integer    | null: false                   |
| status_id   | integer    | null: false                   |
| burden_id   | integer    | null: false                   |
| area_id     | integer    | null: false                   |
| day_id      | integer    | null: false                   |
| price       | integer    | null: false                   |
| user        | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

##　purchaseテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| users    | references | null: false foreign_key: true |
| items    | references | null: false foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :purchase
- has_one :shipping

## shippingテーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefectures_id | integer    | null: false                   |
| city           | string     | null: false                   |
| address        | string     | null: false                   |
| building       | string     |                               |
| number         | string     | null: false                   |
| purchase       | references | null: false foreign_key: true |

### Association
- belongs_to :purchase
