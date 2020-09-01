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
| birthday    | date     | null: false |
### Association
- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| product            | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one_attached :image
- has_one :buy

## buys テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | -------------------------------|
| postcode | string     | null: false                    |
| state_id | integer    | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| building | string     |                                |
| phone    | string     | null: false                    |
| buy      | references | null: false, foreign_key: true |
### Association
- belongs_to :buy


ER図
https://app.diagrams.net/?rev=0B7ZiCZ_M-QT-NEMyWjZKRVBFVjJyS3J3aks3RnlwbDl0RXpRPQ&chrome=0&nav=1&layers=1&edit=_blank&page=-1#G1lD1qOMntPYC-bIV8h9z8xSoqKTW1NmKQ