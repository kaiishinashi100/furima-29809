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
| family-name-full-width | string  | null: false |
| first-name-full-width  | string  | null: false |
| family-name--kana      | string  | null: false |
| first-name--kana       | string  | null: false |
| date                   | string  | null: false |

- has_many :items
- has_one :treasurer

## itemsテーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| item-name                | string  | null: false |
| category                 | string  | null: false |
| place                    | string  | null: false |
| item-file                | string  | null: false |
| explanation              | string  | null: false |
| status                   | string  | null: false |
| delivery-fee             | string  | null: false |
| shipment-source          | string  | null: false |
| delivery-completion-date | string  | null: false |

- belongs_to :users
- belongs_to :treasurer

## treasurersテーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| user_id   | string  | null: false |
| item_id   | string  | null: false |

- belongs_to :users
- has_many :items
- has one :shipping_address

## shipping_addressテーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| address   | string  | null: false |

- belongs_to :treasurers