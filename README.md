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

# テーブル設計

## users テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| nickname    | string   | null: false |
| email       | string   | null: false |
| password    | string   | null: false |
| l_name      | string   | null: false |
| f_name      | string   | null: false |
| l_name_kana | string   | null: false |
| f_name_kana | string   | null: false |
| birth_year  | integer  | null: false |
| birth_month | integer  | null: false |
| birth_day   | integer  | null: false |
### Association
- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| image           | string     | null: false                    |
| product         | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_cost   | string     | null: false                    |
| shipping_origin | string     | null: false                    |
| shipping_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| cardnumber | integer    | null: false                    |
| expmonth   | integer    | null: false                    |
| expyear    | integer    | null: false                    |
| code       | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | -------------------------------|
| postcode | integer    | null: false                    |
| state    | string     | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| building | string     |                                |
| phone    | integer    | null: false                    |
| buy_id   | references | null: false, foreign_key: true |
### Association
- belongs_to :buy