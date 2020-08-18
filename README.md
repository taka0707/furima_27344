# furima

## アプリケーション概要
- ユーザー登録をした者同士で、商品の売り買いができる、フリマアプリケーション

## URL
- https://furima-27344.herokuapp.com/

## テスト用アカウント
- Basic認証
    - ユーザー名: admin
    - パスワード: 2222
- テストアカウント
    - 出品者
        - name: taka
        - email: taka@taka
        - password: taka0707
    - 購入者
        - name: shima
        - email: shima@email
        - password: shima0707
    - 購入用カードの番号・期限・セキュリティコード
        - 番号： 4242424242424242
        - 期限： 3/24
        - セキュリティコード： 123

## 利用方法
- 新規登録（ニックネーム／メールアドレス／パスワード/名前/生年月日）またはログイン※未ログインでも商品一覧と商品詳細は閲覧可能
- 商品一覧の商品をクリックして、商品詳細情報を確認する
- 商品詳細画面から編集、または削除ができる（出品ユーザーのみ可能）
- 商品詳細画面から商品購入画面に移動し、クレジットカードで商品購入ができる（ログインユーザーのみ可能）
- 出品ボタン（カメラアイコン）から商品出品する（ログインユーザーのみ可能）

## 目指した課題解決
- 気軽に不要になった物などを売ったり買ったりできる

## 洗い出した要件
- ユーザー管理機能（新規登録/ログイン/ログアウト）
- 商品登録・表示・編集・削除・購入機能

## ER図
![furima_app_er](https://user-images.githubusercontent.com/66991723/90473868-e5650600-e15e-11ea-98ae-ac046dcd036b.png)

## 画面遷移図
![furimaアプリ画面遷移図](https://user-images.githubusercontent.com/66991723/90473916-0af20f80-e15f-11ea-94fd-e7a3f874cf9a.png)

## 実装した機能
- ユーザー管理機能（deviseを導入して実装）
- 商品表示・編集・削除機能
- 商品出品機能（mini_magick、active_hashを導入して実装）
- 商品購入機能（payjpを導入して実装）

## 実装予定の機能

## 開発環境
- ruby 2.6.5
- Rails 6.0.3.2
- 導入したGem
    - devise
    - pry-rails
    - mini_magick
    - active_hash
    - payjp

## ローカルでの操作方法

#### ターミナル
```
% cd  #ホームディレクトリに移動
% cd 任意のディレクトリ #ディレクトリに移動
% git clone https://github.com/taka0707/furima_27344.git -b for_clone 
% cd furima_27344 #furima_27344ディレクトリに移動
% bundle install
% rails db:create #データベースの作成
% rails db:migrate #マイグレーションの実行
```

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
|birth_date|date|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :item_purchases

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
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :sending_destination
- has_many :comments
- has_many :item_purchases

## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Sending_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## Item_purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :items
