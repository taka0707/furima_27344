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

# DB設計

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|unique: true|
|email|string|null: false|unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :todo_lists

## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|image|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|postage_payer_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|preparation_day_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|deal_closed_date|timestamp|
|buyer_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :sending_destination
- has_many :comments
- has_many :todo_lists

## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :items

## Sending_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Todo_listテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :items
