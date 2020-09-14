# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## usersテーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| password               | string  | null: false |
| family_name_full_width | string  | null: false |
| first_name_full_width  | string  | null: false |
| family_name_kana       | string  | null: false |
| first_name_kana        | string  | null: false |
| birth_day              | date    | null: false |

- has_many :items
- has_many :treasurers

## itemsテーブル

| Column                   | Type    | Options                        |
| ------------------------ | ------- | ------------------------------ |
| name                     | string  | null: false                    |
| category                 | integer | null: false                    |
| place                    | integer | null: false                    |
| explanation              | text    | null: false                    |
| status                   | integer | null: false                    |
| delivery_fee             | integer | null: false                    |
| shipment_source          | integer | null: false                    |
| delivery_completion_date | integer | null: false                    |
| user_id                  | string  | null: false, foreign_key: true |

- belongs_to :user
- has_one :treasurer

## treasurersテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |


- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    |
| prefecture    | integer | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| treasurer_id  | integer | null: false, foreign_key: true |

- belongs_to :treasurer