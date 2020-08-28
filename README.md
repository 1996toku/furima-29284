# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :purchse

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| shopping_chipping   | string     | null: false                    |
| area_of_delivary    | string     | null: false                    |
| days_until_shopping | string     | null: false                    |
| price               | integer    | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase

## purchase テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_nunber           | integer    | null: false                    |
| expiration_date_monse | integer    | null: false                    |
| expiration_date_date  | integer    | null: false                    |
| security_code         | integer    | null: false                    |
| items                 | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :street_address

## street_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_nunber  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase